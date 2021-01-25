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
