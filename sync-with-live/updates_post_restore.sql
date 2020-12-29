UPDATE `core_config_data` SET `value` = 'http://dev.magento241/' WHERE `core_config_data`.`value` = 'http://live.magento241/';
UPDATE `core_config_data` SET value = 'NOINDEX,NOFOLLOW' WHERE path = 'design/search_engine_robots/default_robots';

UPDATE wp_options SET option_value='http://dev.magento241/wp' WHERE option_name = 'siteurl';
UPDATE wp_options SET option_value='http://dev.magento241/blog' WHERE option_name = 'home';
UPDATE wp_options SET option_value='{"base_url":"http:\/\/dev.magento241\/","version":2}' WHERE option_name = 'fishpig_magento';
