# Magento 2 All Commands

### comman commands

- Setup upgrade

```bash

 php bin/magento setup:upgrade

```
- Compilation 

```bash

 php bin/magento setup:di:compile

```
- Deployment

```bash

 php bin/magento setup:static:content:deploy
 
 php bin/magento setup:static:content:deploy -f
 
 php bin/magento setup:static:content:deploy -f en_GB en_US fr_FR

 php bin/magento setup:static:content:deploy -f -a frontend -t Smartwave/porto_child

```

## Get DB info

```bash

 grep -n "host" -A 4 app/etc/env.php

 grep [\']db[\'] -A 20 app/etc/env.php | grep dbname | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/['][,]//"

 grep [\']db[\'] -A 20 app/etc/env.php | grep host | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/['][,]//"

 grep [\']db[\'] -A 20 app/etc/env.php | grep username | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/['][,]//"

 grep [\']db[\'] -A 20 app/etc/env.php | grep password | head -n1 | sed "s/.*[=][>][ ]*[']//" | sed "s/[']$//" | sed "s/['][,]//"

```
## Update config

```note
web/unsecure/base_url - https://dev.site.fr/
web/unsecure/base_static_url - {{unsecure_base_url}}pub/static/
web/unsecure/base_media_url - {{unsecure_base_url}}pub/media/
web/unsecure/base_link_url - https://dev2.site.fr/
web/secure/base_url - https://dev2.site.fr/
web/secure/base_static_url -
web/secure/base_media_url -

richsnippets/organization/url - https://site.Fr
richsnippets/website/siteurl - https://dev2.site.fr/

```
Update url in db using set config

```bash

# php bin/magento config:set web/unsecure/base_url https://dev2.iturbo.fr/pub/ && php bin/magento config:set web/unsecure/base_static_url {{unsecure_base_url}}static/ && php bin/magento config:set web/unsecure/base_media_url {{unsecure_base_url}}media/ && php bin/magento config:set web/unsecure/base_link_url https://dev2.iturbo.fr/pub/ && php bin/magento config:set web/secure/base_url https://dev2.iturbo.fr/pub/ && php bin/magento config:set web/secure/base_static_url {{secure_base_url}}static/ && php bin/magento config:set web/secure/base_media_url {{secure_base_url}}media/

```

generate i18n for perticuler module

```bash

# php bin/magento i18n:collect-phrases -o "/home/site/public_html/app/i18n/bhaveshpp/fr_fr/temp.csv" /home/site/public_html/vendor/aheadworks/module-reward-points/

```