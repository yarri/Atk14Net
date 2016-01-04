<?php
// composer
if(file_exists(__DIR__."/../vendor/autoload.php")){
	require(__DIR__."/../vendor/autoload.php");
}

if(
	!TEST &&
	!$HTTP_REQUEST->xhr() &&
	class_exists("Tracy\Debugger") &&
	php_sapi_name()!="cli" // we do not want Tracy in cli
){
	Tracy\Debugger::enable(PRODUCTION, __DIR__ . '/../log/',ATK14_ADMIN_EMAIL);
}
