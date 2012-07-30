<?php
class SnippetsController extends ApplicationController{
	function detail(){
		$id = $this->params->getString("id");
		if(!isset($this->snippets[$id])){
			return $this->_execute_action("error404");
		}

		$this->tpl_data["snippet"] = $this->snippets[$id];
		$this->page_title = $this->snippets[$id]["title"];
	}

	/**
	 * Reads all snippets from filesystem
	 */
	function _read_snippets(){
		$snippets = array();
		foreach(glob(__DIR__."/../views/snippets/snippets/_*.tpl") as $filename){
			//
			preg_match('/_([a-z0-9_]+)\.tpl$/',$filename,$matches);
			$id = $matches[1];
			$template = "snippets/$matches[1]";

			// 
			$content = files::get_file_content($filename);
			$title = "";
			if(preg_match('/<h3>(.+?)<\/h3>/',$content,$matches)){ $title = $matches[1]; }

			$snippets[] = array(
				"id" => $id,
				"template" => $template,
				"filename" => $filename,
				"title" => $title,
			);
		}
		for($i=0;$i<sizeof($snippets);$i++){
			$snippets[$i]["next"] = $i==sizeof($snippets)-1 ? $snippets[0] : $snippets[$i+1];
			$snippets[$i]["prev"] = $i==0 ? $snippets[sizeof($snippets)-1] : $snippets[$i-1];
		}

		$_snippets = array();
		foreach($snippets as $s){ $_snippets[$s["id"]] = $s; }
		return $_snippets;
	}

	function _before_filter(){
		$this->snippets = $this->_read_snippets();
	}
}
