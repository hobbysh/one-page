<?php
define('APP_START_TIME', microtime(1));

//路径定义
//define('PHPLIB',    '/var/www/html/phplib');
define('ROOT_PATH', dirname(__DIR__));
define('APP_PATH',  ROOT_PATH.'/app');
define('APP_CONF',  ROOT_PATH.'/conf');
define('APP_VIEW',  APP_PATH.'/views');
define('APP_LOG',  APP_PATH.'/logs');

/* 定义这个常量是为了在application.ini中引用*/
define('APPLICATION_PATH', dirname(__FILE__));

require __DIR__.'/vendor/autoload.php';

$application = new \Yaf\Application( APPLICATION_PATH . "/conf/application.ini");

$application->bootstrap()->run();
?>
