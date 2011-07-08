<?
class DefaultRouter extends Atk14Router{
	
	function 
 	"" => 																		array(
																						"lang" => $ATK14_GLOBAL->getDefaultLang(),
																						"__path__" => "main/index",
																						"__page_title__" => ATK14_APPLICATION_NAME,
																						"__page_description__" => _("my beautiful application"),
																						),

	"<lang>" =>																array(
																						"__path__" => "main/index",
																						),

	"<lang>/<controller>" =>									array(
																						"action" => "index",
																						),
	
	"<lang>/<controller>/<action>" =>					array(
																						),
}
