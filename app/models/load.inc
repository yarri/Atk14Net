<?
if(function_exists("spl_autoload_register")){

	// for autoload capable PHP5
	function autoload_model($class_name){
		static $STORE;
		if(!isset($STORE)){ $STORE = array(); }

		settype($class_name,"string");
		if(isset($STORE[$class_name])){ return; }

		$file_name = $class_name;
		$file_name = preg_replace("/[A-Z]/","_\\0",$file_name);
		$file_name = strtolower($file_name);
		$file_name = preg_replace("/^_/","",$file_name);
		$file_name .= ".inc";
		$file_name = dirname(__FILE__)."/".$file_name;
		file_exists($file_name) && require_once($file_name);
		$STORE[$class_name] = true;
	}
	spl_autoload_register("autoload_model");

}else{

	// for PHP4
	require_once(dirname(__FILE__)."/model.inc");
	require_once(dirname(__FILE__)."/user.inc");
	require_once(dirname(__FILE__)."/category.inc");
	require_once(dirname(__FILE__)."/product.inc");
	require_once(dirname(__FILE__)."/cart.inc");
	require_once(dirname(__FILE__)."/cart_item.inc");
}
?>
