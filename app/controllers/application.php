<?php
class ApplicationController extends Atk14Controller{

	/**
	 * @var Menu14
	 */
	var $breadcrumbs;

	function forbidden(){
		$this->response->forbidden();
		$this->render_template = false;
	}

	function _initialize(){
		$this->doc_source_files = array(); // array for files to be included within auto documentation

		$this->_prepend_before_filter("application_before_filter");
		$this->_append_after_filter("application_after_filter");

		if(!$this->rendering_component){
			$this->_prepend_before_filter("begin_database_transaction");
			$this->_append_after_filter("end_database_transaction");
		}
	}

	function _application_before_filter(){
		$this->user = User::GetInstanceById($this->session->g("user_id"));

		$this->breadcrumbs = new Menu14();
		$this->breadcrumbs[] = array("Home",$this->_link_to(array("namespace" => "", "action" => "main/index")));
	}

	function _application_after_filter(){
	}

	function _begin_database_transaction(){
		$this->dbmole->begin(array(
			"execute_after_connecting" => true
		));
	}

	function _end_database_transaction(){
		if(TEST){ return; }
		$this->dbmole->isConnected() && $this->dbmole->commit();
	}

	function _rollback(){
		$this->dbmole->rollback();
		$this->_begin_database_transaction();
	}

	function _before_render(){
		$this->tpl_data["user"] = $this->user;

		$namespace = strlen($this->namespace) ? "/$this->namespace" : "";
		$basedir = dirname(__FILE__)."/../../";
		$files = array(
			"app/controllers$namespace/{$this->controller}_controller.php",
			"app/forms$namespace/$this->controller/{$this->action}_form.php",
			"app/forms$namespace/$this->controller/{$this->controller}_form.php",
			"app/views$namespace/$this->controller/{$this->action}.tpl",
			"app/views$namespace/$this->controller/{$this->action}.xhr.tpl",
		);
		foreach($files as $f){
			if(file_exists("$basedir/$f")){
				$this->doc_source_files[] = $f;
			}
		}
		$this->tpl_data["doc_source_files"] = $this->doc_source_files;

		if(!isset($this->tpl_data["breadcrumbs"]) && isset($this->breadcrumbs)){
			$this->tpl_data["breadcrumbs"] = $this->breadcrumbs;
		}
	}

	function _after_render(){
		parent::_after_render();
	}
}
