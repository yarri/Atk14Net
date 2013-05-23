<?php

class SourcesController extends ApplicationController{

	/**
	 * Displays content of a given file.
	 */
	function detail(){
		$file = $this->params->getString("file");
		$filename = dirname(__FILE__)."/../../$file";

		$sanitized_file = $file;
		$sanitized_file = preg_replace('/(\.\.|\/\/|\s|\.\/|\/\.)/','',$sanitized_file);
		$sanitized_file = preg_replace('/^(\/|\.)/','',$sanitized_file);

		if(in_array($sanitized_file,array("config/random.txt"))){	// forbidden files 
			$sanitized_file = "";
		}

		if($sanitized_file=="" || $sanitized_file!=$file || !file_exists($filename) || !is_file($filename)){
			return $this->_execute_action("error404");
		}

		$this->page_title = sprintf("%s source code",preg_replace('/.*\/([^\/]+)$/','\1',$file));
		
		$source = file_get_contents($filename);

		// respond to "raw" format
		if($this->params->getString("format")=="raw"){
			$this->render_template = false;
			$this->response->write($source);
			$this->response->setContentType("text/plain");
			return;
		}

		$source = str_replace("\t","  ",$source);

		$replaces = array();

		if(preg_match("/\\.tpl$/",$file)){
			if(preg_match_all("/({render[^}]+partial=)(['\"]|)([^\\s}]+)(['\"]|)/",$source,$matches)){
				for($i=0;$i<sizeof($matches[3]);$i++){
					$link = "<a href=\"".$this->_link_to(array("file" => $this->_find_shared_template($matches[3][$i],$filename)))."\" data-remote=\"true\">{$matches[3][$i]}</a>";
					$replaces[$matches[0][$i]] = $matches[1][$i].$matches[2][$i].$link.$matches[4][$i];
				}
			}
		}

		if(preg_match("/\\.(inc|php)$/",$file)){

			// searching for fields
			// 
			if(preg_match_all("/([a-zA-Z0-9]+Field)/",$source,$matches)){
				for($i=0;$i<sizeof($matches[1]);$i++){
					if($field_file = $this->_find_field_file($matches[1][$i])){
						$link = "<a href=\"".$this->_link_to(array("file" => $field_file))."\" data-remote=\"true\">{$matches[1][$i]}</a>";
						$replaces[$matches[0][$i]] = $link;
					}
				}
			}

			// searching for models
			// Book::GetInstanceById(123) -> <a href="...">Book</a>::GetInstanceById(123)
			if(preg_match_all("/([a-zA-Z0-9]+)((<[^>]+>)+::)/",$source,$matches)){
				for($i=0;$i<sizeof($matches[1]);$i++){
					if($field_file = $this->_find_model_file($matches[1][$i])){
						$link = "<a href=\"".$this->_link_to(array("file" => $field_file))."\" data-remote=\"true\">{$matches[1][$i]}</a>";
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
			return "app/views$shared_filename";
		}
		return "???";
	}

	function _find_field_file($field_class){
		$field = new String($field_class);
		$filename = "app/fields/".$field->underscore().".php";
		if(file_exists(ATK14_DOCUMENT_ROOT."/$filename")){
			return $filename;
		}
	}

	function _find_model_file($model_class){
		$model = new String($model_class);
		$filename = "app/models/".$model->underscore().".php";
		if(file_exists(ATK14_DOCUMENT_ROOT."/$filename")){
			return $filename;
		}
	}
}
