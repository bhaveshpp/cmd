# COMMANDS

## Recently used

### Backup Magento 

Code

```

# zip -r code-20210202.zip app/ bin/ dev/ lib/ phpserver/ setup/ vendor/ .htaccess composer.json composer.lock index.php .user.ini pub/ -x pub/media/**\* pub/static/frontend/**\* pub/static/adminhtml/**\*

```

DB

```
# mysqldump -u magento2_user -p magento2_db | gzip > magento2_db-20201110.sql.gz

```


### install Magento

`
 composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .
`

```
# php -d memory_limit=-1  composer.phar create-project --repository-url=https://repo.magento.com/ magento/project-community-edition --ignore-platform-reqs  -vvv
```

```
# php -d memory_limit=-1  composer.phar require magento/data-migration-tool:2.2.0 --ignore-platform-reqs  -vvv
```

```
# sudo php bin/magento setup:install --base-url=http://192.168.0.100/magento/ --db-host=localhost --db-name=magento --db-user=magento --db-password=magento --admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com --admin-user=admin --admin-password=admin@123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1

```

Find file name

 ` # find ./app/ -name "registration.php" `
 
Find string 

 ` # grep -Rni "lol" ./app/code/ ` 
 
 ` # grep -rnw "gabarit-center" --include=*.{phtml} app/ ` 


## MySQL

Dump mysql database

` # mysqldump -u magento2_user -p magento2_db > magento2_db-20201110.sql `

` # mysqldump ---single-transaction -u magento2_user -p magento2_db > magento2_db-20201110.sql `

` # mysqldump -u magento2_user -p magento2_db | gzip > magento2_db-20201110.sql.gz `

Create new user and assign permission

```
CREATE USER 'magento2_user'@'localhost' IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES ON magento2_db.* TO 'magento2_user'@'localhost';

GRANT SELECT,LOCK TABLES ON magento2_db.* TO 'magento2_user'@'localhost';

FLUSH PRIVILEGES;

```

Change password

` # ALTER USER magento2_user@localhost IDENTIFIED BY 'password123'; `

Check user permission

` # SHOW GRANTS FOR 'magento2_user'@'localhost'; `

Assign lock previleges if error in dump

` # GRANT SELECT,LOCK TABLES ON iturbo_v4_20201110.* TO 'magento2_iturbo'@'localhost';`

### Magento 1 create user using SQL

```
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

```

UPDATE `eav_attribute` 
SET `backend_type` = 'text', `frontend_input`= 'textarea' 
WHERE `attribute_code` in ('oem_mp','ref_fabricant_mp');

```

#### For testing purpos if you insert data 

```

INSERT INTO `catalog_product_entity_text` (`attribute_id`, `store_id`, `entity_id`, `value`)
SELECT `attribute_id`,`store_id`,`entity_id`,`value`  FROM `catalog_product_entity_varchar` WHERE `attribute_id` 
IN (SELECT `attribute_id` FROM `eav_attribute` WHERE `attribute_code` IN ('ref_fabricant_mp','oem_mp'))
AND `entity_id`= 4; 

```

#### Then delete it first before mass insert action

```

DELETE FROM `catalog_product_entity_text` WHERE `attribute_id` 
IN (SELECT `attribute_id` FROM `eav_attribute` WHERE `attribute_code` IN ('ref_fabricant_mp','oem_mp'))
AND `entity_id` IN (4,5,6); 

```

#### And then perform bulk action

```

INSERT INTO `catalog_product_entity_text` (`attribute_id`, `store_id`, `entity_id`, `value`)
SELECT `attribute_id`,`store_id`,`entity_id`,`value`  FROM `catalog_product_entity_varchar` WHERE `attribute_id` 
IN (SELECT `attribute_id` FROM `eav_attribute` WHERE `attribute_code` IN ('ref_fabricant_mp','oem_mp'));

```

## Sync live site with dev

[Script for ubuntu](https://bhaveshpp.github.io/cmd/linux/sync-with-live/)

