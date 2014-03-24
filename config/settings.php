<?php
/**
* Either some parts of ATK14 system (i.e. mailing subsystem) or some third party libs
* could be configured by constants or variables.
* 
* This file is the right place to do such configuration.
*
* You can inspect all ATK14 system`s constants in sys/src/default_settings.inc
*/

define('SECRET_TOKEN',PRODUCTION ? Files::GetFileContent(__DIR__."/secret_token.txt") : 'djfklsjdfkljsfiu903480	sjs92i0F>jjdpwojdp[');

define("ATK14_DOCUMENT_ROOT",dirname(__FILE__)."/../");
define("ATK14_HTTP_HOST",PRODUCTION ? "www.atk14.net" : "atk14.localhost");
define("ATK14_APPLICATION_NAME","ATK14");

// We do not want to send e-mails from The Demo Application
define("SENDMAIL_DO_NOT_SEND_MAILS",true);

if(DEVELOPMENT){
	// place for development environment settings

}

if(PRODUCTION){
	// place for production environment settings

}

if(TEST){
	// place for test environment settings

}
