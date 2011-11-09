<?
/**
* Either some parts of ATK14 system (i.e. mailing subsystem) or some third party libs
* could be configured by constants or variables.
* 
* This file is the right place to do such configuration.
*
* You can inspect all ATK14 system`s constants in sys/src/default_settings.inc
*/

define("SECRET_TOKEN",(file_exists(dirname(__FILE__)."/random.txt") ? files::get_file_content(dirname(__FILE__)."/random.txt",$err,$err_str) : "djfklsjdfkljsfiu903480	sjs92i0F>jjdpwojdp["));

define("ATK14_DOCUMENT_ROOT",dirname(__FILE__)."/../");
define("ATK14_HTTP_HOST",PRODUCTION ? "www.atk14.net" : "atk14.localhost");
define("ATK14_APPLICATION_NAME","ATK14 Website");

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


