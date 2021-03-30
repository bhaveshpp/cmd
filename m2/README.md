# Magento 2 All Commands

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
## Get DB info

```
grep -n "host" -A 4 app/etc/env.php
```
## Update config

```
web/unsecure/base_url - https://dev.site.fr/
web/unsecure/base_static_url - {{unsecure_base_url}}pub/static/
web/unsecure/base_media_url - {{unsecure_base_url}}pub/media/
web/unsecure/base_link_url - https://dev2.site.fr/
web/secure/base_url - https://dev2.site.fr/
web/secure/base_static_url -
web/secure/base_media_url -

richsnippets/organization/url - https://site.Fr
richsnippets/website/siteurl - https://dev2.site.fr/

php bin/magento config:set web/unsecure/base_url https://dev2.iturbo.fr/pub/ && php bin/magento config:set web/unsecure/base_static_url {{unsecure_base_url}}static/ && php bin/magento config:set web/unsecure/base_media_url {{unsecure_base_url}}media/ && php bin/magento config:set web/unsecure/base_link_url https://dev2.iturbo.fr/pub/ && php bin/magento config:set web/secure/base_url https://dev2.iturbo.fr/pub/ && php bin/magento config:set web/secure/base_static_url {{secure_base_url}}static/ && php bin/magento config:set web/secure/base_media_url {{secure_base_url}}media/

```