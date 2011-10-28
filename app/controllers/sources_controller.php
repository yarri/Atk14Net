<?php
class SourcesController extends ApplicationController{

	/**
	* Displays content of a given file.
	*/
	function detail(){
		$file = $this->params->g("file");
		$filename = dirname(__FILE__)."/../$file";

		$sanitized_file = preg_replace("/\\.\\.\\//","",$file);
		if($sanitized_file=="" || $sanitized_file!=$file || !file_exists($filename)){
			return $this->_execute_action("error404");
		}
		
		$source = file_get_contents($filename);
		$source = str_replace("\t","  ",$source);
		if(preg_match("/\\.(inc|php)$/",$file)){
			$source = highlight_string($source,true);
		}else{
			$source = htmlspecialchars($source);
		}

		$replaces = array();

		if(preg_match("/\\.tpl$/",$file)){
			if(preg_match_all("/({render[^}]+partial=)(['\"]|)([^\\s}]+)(['\"]|)/",$source,$matches)){
				for($i=0;$i<sizeof($matches[3]);$i++){
					$link = "<a href=\"".$this->_link_to(array("file" => $this->_find_shared_template($matches[3][$i],$filename)))."\">{$matches[3][$i]}</a>";
					$replaces[$matches[0][$i]] = $matches[1][$i].$matches[2][$i].$link.$matches[4][$i];
				}
			}
		}

		if(preg_match("/\\.(inc|php)$/",$file)){

			// searching fields
			if(preg_match_all("/([a-zA-Z0-9]+Field)/",$source,$matches)){
				for($i=0;$i<sizeof($matches[1]);$i++){
					if($field_file = $this->_find_field_file($matches[1][$i])){
						$link = "<a href=\"".$this->_link_to(array("file" => $field_file))."\">{$matches[1][$i]}</a>";
						$replaces[$matches[0][$i]] = $link;
					}
				}
			}

			// searching models
			if(preg_match_all("/([a-zA-Z0-9]+)((<[^>]+>)+::)/",$source,$matches)){
				for($i=0;$i<sizeof($matches[1]);$i++){
					if($field_file = $this->_find_model_file($matches[1][$i])){
						$link = "<a href=\"".$this->_link_to(array("file" => $field_file))."\">{$matches[1][$i]}</a>";
						$replaces[$matches[0][$i]] = $link.$matches[2][$i];
					}
				}
			}

		}

		$source = strtr($source,$replaces);

		

		$this->tpl_data["source"] = $source;
		$this->tpl_data["file"] = $file;
	}

	function _find_shared_template($shared_name,$filename){
		$ar = explode("/",$filename);
		$shared_name = preg_replace("/([^\\/]+)$/","_\\1",$shared_name);
		array_pop($ar);
		while(sizeof($ar)){
			$shared_filename = join("/",$ar)."/{$shared_name}.tpl";
			if(file_exists($shared_filename)){
				$shared_filename = preg_replace("/.*\\/..\\//","",$shared_filename);
				return $shared_filename;
			}
			array_pop($ar);
		}
		if(file_exists(dirname(__FILE__)."/../views/$shared_filename")){
			return "views$shared_filename";
		}
		return "???";
	}

	function _find_field_file($field_class){
		$field = new String($field_class);
		$filename = "fields/".$field->underscore().".php";
		if(file_exists(ATK14_DOCUMENT_ROOT."/app/$filename")){
			return $filename;
		}
	}

	function _find_model_file($model_class){
		$model = new String($model_class);
		$filename = "models/".$model->underscore().".php";
		//echo ATK14_DOCUMENT_ROOT."/app/$filename"; exit;
		if(file_exists(ATK14_DOCUMENT_ROOT."/app/$filename")){
			return $filename;
		}
	}
}
