<?
class ApplicationController extends Atk14Controller{

	function forbidden(){
		$this->response->forbidden();
		$this->render_template = false;
	}

	function _initialize(){
		$this->dbmole = &PgMole::GetInstance();

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
		($this->cart = $this->session->g("cart")) || ($this->cart = new Cart());
	}

	function _application_after_filter(){
		if(!$this->cart->isEmpty()){
			$this->session->s("cart",$this->cart);
		}
	}

	function _begin_database_transaction(){
		$this->dbmole->begin();
	}

	function _end_database_transaction(){
		$this->dbmole->commit();
	}

	function _rollback(){
		$this->dbmole->rollback();
		$this->dbmole->begin();
	}

	function _before_render(){
		$this->tpl_data["user"] = $this->user;
		$this->tpl_data["cart"] = $this->cart;

		$namespace = strlen($this->namespace) ? "/$this->namespace" : "";
		$basedir = dirname(__FILE__)."/..";
		$files = array(
			"controllers$namespace/{$this->controller}_controller.inc",
			"forms$namespace/$this->controller/{$this->action}_form.inc",
			"views$namespace/$this->controller/{$this->action}.tpl",
			"views$namespace/$this->controller/{$this->action}.xhr.tpl",
		);
		foreach($files as $f){
			if(file_exists("$basedir/$f")){
				$this->doc_source_files[] = $f;
			}
		}
		$this->tpl_data["doc_source_files"] = $this->doc_source_files;
	}
}
?>
