<?
/**
* Either some parts of ATK14 system (i.e. mailing subsystem) or some third party libs
* could be configured by constants or variables.
* 
* This file is the right place to do such configuration.
*
* You can inspect all ATK14 system`s constants in sys/src/default_settings.inc
*/

define("SECRET_TOKEN","put_some_random_string_here");

define("ATK14_DOCUMENT_ROOT",dirname(__FILE__)."/../");
define("ATK14_BASE_HREF","/atk14demo/");

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


