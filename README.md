# COMMANDS

## Recently used

Admin user cerate

```bash
 php bin/magento admin:user:create --admin-user='dev' --admin-password='password123' --admin-email='dev@gmail.com' --admin-firstname='Admin' --admin-lastname='dev'
```


### Backup Command 

Code

```bash

 zip -r code-20210202.zip app/ bin/ dev/ lib/ phpserver/ setup/ vendor/ .htaccess composer.json composer.lock index.php .user.ini pub/ -x pub/media/**\* pub/static/frontend/**\* pub/static/adminhtml/**\*

```

DB

```bash

 mysqldump -u magento2_user -p magento2_db | gzip > magento2_db-20201110.sql.gz

```

Code 

```bash

 tar -czvf ~/multi_dump.tar.gz --exclude=var/cache --exclude=var/session --exclude=var/log --exclude=var/tmp --exclude=var/export --exclude=var/report --exclude=var/backups --exclude='media/*import*' --exclude=media/tmp --exclude=media/downloadable --exclude=media/catalog . && echo OK

 tar -czvf /var/www/html/magento1/backup/multi_dump_without_media.tar.gz --exclude=var/cache --exclude=var/session --exclude=var/log --exclude=var/tmp --exclude=var/export --exclude=var/report --exclude=var/backups --exclude='media/*import*' --exclude=media/tmp --exclude=media/downloadable --exclude=media/catalog --exclude=media/amasty/amoptmobile --exclude=media/amasty/webp --exclude=static/frontend --exclude=static/adminhtml  --exclude=backup --exclude=media/amasty/amoptimizer_dump --exclude=media/amasty/amopttablet . && echo OK

```

Database

```bash 

 mysqldump --single-transaction --add-drop-table -h <host> -u <user> -p <db_name> | gzip > dump.sql.gz

```


### install Magento

```bash

 composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .

```

with increase php memory limit.

```bash

 php -d memory_limit=-1  composer.phar create-project --repository-url=https://repo.magento.com/ magento/project-community-edition --ignore-platform-reqs  -vvv

```
Install specific version

```bash 

 php -d memory_limit=-1  composer.phar require magento/data-migration-tool:2.2.0 --ignore-platform-reqs  -vvv

```

Install command

```bash

 sudo php bin/magento setup:install --base-url=http://192.168.0.100/magento/ --db-host=localhost --db-name=magento --db-user=magento --db-password=magento --admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com --admin-user=admin --admin-password=admin@123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1

```

Find file name

```bash

 find ./app/ -name "registration.php" 

 ```
 
Find string 

```bash 

 grep -Rni "lol" ./app/code/ 
 
 grep -rnw "gabarit-center" --include=*.{phtml} app/ 

```


## MySQL

Dump mysql database

```bash 

 mysqldump -u magento2_user -p magento2_db > magento2_db-20201110.sql 

 mysqldump ---single-transaction -u magento2_user -p magento2_db > magento2_db-20201110.sql 

 mysqldump -u magento2_user -p magento2_db | gzip > magento2_db-20201110.sql.gz 

```

Create new user and assign permission

```sql

CREATE USER 'magento2_user'@'localhost' IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES ON magento2_db.* TO 'magento2_user'@'localhost';

GRANT SELECT,LOCK TABLES ON magento2_db.* TO 'magento2_user'@'localhost';

FLUSH PRIVILEGES;

```

Change password

```sql

 ALTER USER magento2_user@localhost IDENTIFIED BY 'password123'; 

```

Check user permission

```sql

 SHOW GRANTS FOR 'magento2_user'@'localhost'; 
 
```

Assign lock previleges if error in dump

```sql

 GRANT SELECT,LOCK TABLES ON iturbo_v4_20201110.* TO 'magento2_iturbo'@'localhost';

```

### Magento 1 create user using SQL

```sql

LOCK TABLES `admin_role` WRITE , `admin_user` WRITE;
 
SET @SALT = "rp";
SET @PASS = CONCAT(MD5( CONCAT(@SALT, "Developer@test") ), CONCAT(":", @SALT));
SELECT @EXTRA := MAX(extra) FROM admin_user WHERE extra IS NOT NULL;
 
INSERT INTO `admin_user` (firstname, lastname, email, username, password, created, lognum, reload_acl_flag, is_active, extra, rp_token_created_at) 
VALUES ('Developer', 'Iturbo', 'developer@test.com', 'developer_', @PASS,NOW(), 0, 0, 1, @EXTRA,NOW());
 
INSERT INTO `admin_role` (parent_id, tree_level, sort_order, role_type, user_id, role_name) 
VALUES (1, 2, 0, 'U', (SELECT user_id FROM admin_user WHERE username = 'developer_'), 'Developer');
 
UNLOCK TABLES;

```

### To change Attribute datatype Magento 2

```sql

UPDATE `eav_attribute` 
SET `backend_type` = 'text', `frontend_input`= 'textarea' 
WHERE `attribute_code` in ('oem_mp','ref_fabricant_mp');

```

#### For testing purpos if you insert data 

```sql

INSERT INTO `catalog_product_entity_text` (`attribute_id`, `store_id`, `entity_id`, `value`)
SELECT `attribute_id`,`store_id`,`entity_id`,`value`  FROM `catalog_product_entity_varchar` WHERE `attribute_id` 
IN (SELECT `attribute_id` FROM `eav_attribute` WHERE `attribute_code` IN ('ref_fabricant_mp','oem_mp'))
AND `entity_id`= 4; 

```

#### Then delete it first before mass insert action

```sql

DELETE FROM `catalog_product_entity_text` WHERE `attribute_id` 
IN (SELECT `attribute_id` FROM `eav_attribute` WHERE `attribute_code` IN ('ref_fabricant_mp','oem_mp'))
AND `entity_id` IN (4,5,6); 

```

#### And then perform bulk action

```sql

INSERT INTO `catalog_product_entity_text` (`attribute_id`, `store_id`, `entity_id`, `value`)
SELECT `attribute_id`,`store_id`,`entity_id`,`value`  FROM `catalog_product_entity_varchar` WHERE `attribute_id` 
IN (SELECT `attribute_id` FROM `eav_attribute` WHERE `attribute_code` IN ('ref_fabricant_mp','oem_mp'));

```

Import database

```bash

 cat /home/magento_user/Backup/db-bkp-20210204.sql | mysql -u root -pPass123 db1_new

```

