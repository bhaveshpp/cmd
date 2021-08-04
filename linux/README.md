

## wget

```bash
wget --user developer --password dev.test https://host.gost/amasty-extrafee-20210804.zip

```

## tar 

```bash

# compress

tar -czvf amasty-extrafee-20210804.tar.gz app/code/Amasty app/design/frontend/MageBig/martfury/child/Amasty_Extrafee app/design/frontend/MageBig/martfury/child/Slivtech_AutoUpdateCartQty/templates/cart/form.phtml

# extrac

tar -xvzf amasty-extrafee-20210804.tar.gz

# magento project with media

tar -czvf multi_dump-20210804.tar.gz \
--exclude=pub/media/catalog/product/cache \
--exclude=pub/media/captcha \
--exclude=pub/media/downloadable \
--exclude=pub/media/media.zip \
--exclude=pub/media/mageplaza/blog/post/resize \
--exclude=pub/media/import \
--exclude=pub/static/adminhtml \
--exclude=pub/static/frontend \
--exclude=pub/static/_cache \
--exclude=pub/static/deployed_version.txt \
--exclude=generated/code \
--exclude=generated/metadata \
--exclude=var/cache \
--exclude=var/page_cache \
--exclude=var/view_preprocessed \
--exclude=var/report \
--exclude=var/log \
--exclude=var/export \
--exclude=var/importexport \
--exclude=var/import_history \
--exclude=var/solitairelabdiamond_2021-05-22.zip \
. && echo OK

```