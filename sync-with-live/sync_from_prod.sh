#!/bin/bash

################
# CONF
SRV_PROD=192.168.0.100
SRV_USER=site_ssh_user
# ne PAS terminer SRV_FOLDER par un slash
SRV_REMOTE_FOLDER=/home/site/public_html
SRV_EXCLUDE="--exclude=public_html/app/etc/* --exclude=public_html/pub/static/* --exclude=public_html/generated/code/* --exclude=public_html/var/* --exclude=public_html/pub/media/captcha/* --exclude=public_html/wp/wp-config.php"

REMOTE_DB_NAME=site_db
REMOTE_DB_CRED=/home/site/.my.cnf

LOCAL_DB_NAME=dev-site-magento
LOCAL_DB_CRED=/home/dev-site/.my.cnf
# END
################


read -p "Are you sure you want to sync with the production (O/N) ?" -n 1 -r
echo ""
if [[ $REPLY =~ ^[YyOo]$ ]]
then
	echo "ok, Let's Start..."
	echo "sync files..."
	REMOTE_FOLDER="${SRV_REMOTE_FOLDER%/}"
	LOCAL_FOLDER="$HOME/"
	rsync -e "ssh -o StrictHostKeyChecking=no" -az --info=progress2 --stats --delete $SRV_EXCLUDE $SRV_USER@$SRV_PROD:$REMOTE_FOLDER $LOCAL_FOLDER
	# version with detail displayed
	# rsync -e "ssh -o StrictHostKeyChecking=no" -avPz --stats --delete $SRV_EXCLUDE $SRV_USER@$SRV_PROD:$REMOTE_FOLDER $LOCAL_FOLDER

        echo "Backup of the prod database $REMOTE_DB_NAME..."
	# Delete the old backup if it exists
	TMP_DB_FILE="/tmp/prod.sql.gz"
	if [ -f $TMP_DB_FILE ]; then
		rm -f $TMP_DB_FILE
	fi

	# Backup
	if [ ! -f "$TMP_DB_FILE" ]; then
		ssh "$SRV_USER@$SRV_PROD" "mysqldump --defaults-file=$REMOTE_DB_CRED --lock-tables=false --single-transaction=TRUE $REMOTE_DB_NAME | gzip -9" > $TMP_DB_FILE
	else
		echo "impossible de continuer, le fichier $TMP_DB_FILE n'a pas été correctement supprimé"
		exit 100
	fi

	# file created?
	if [ ! -f "$TMP_DB_FILE" ]; then
		echo "Error: database copy $TMP_DB_FILE !!"
		exit 101
	fi

	# mysql local accessible ?
	PING=$(mysqladmin --defaults-file=$LOCAL_DB_CRED ping 2>/dev/null)
	if [ "$PING" != "mysqld is alive" ]; then
		echo "Error: Unable to connect to local mySQL !!"
		exit 102
	fi

	# list the databases and create if necessary
	DBS_LIST=$(echo "show databases;"|mysql --defaults-file=$LOCAL_DB_CRED -N)
	if [[ ! $DBS_LIST =~ $LOCAL_DB_NAME ]]; then
		echo "creation of the local database $LOCAL_DB_NAME..."
		mysql --defaults-file=$LOCAL_DB_CRED -e "CREATE DATABASE $LOCAL_DB_NAME"
	fi

	# restore
	echo "restoration of $LOCAL_DB_NAME with $TMP_DB_FILE..."
	zcat $TMP_DB_FILE | mysql --defaults-file=$LOCAL_DB_CRED $LOCAL_DB_NAME

	# Post restore SQL query
	mysql --defaults-file=$LOCAL_DB_CRED $LOCAL_DB_NAME < /home/dev-site/scripts/updates_post_restore.sql

	# modifications Magento
	#set -e
	set -euxo pipefail
	pushd ~/public_html
	sudo chown -R dev-site-user:dev-site-group *
	php bin/magento deploy:mode:set developer
	php bin/magento setup:upgrade
	php bin/magento setup:di:compile
	php bin/magento setup:static-content:deploy -f en_US fr_FR
	php bin/magento indexer:reindex
	php bin/magento wyomind:elasticsearchcore:indexer:reindex
	php bin/magento cache:clean
	popd
	set +e

else
        echo "No modification."
fi
