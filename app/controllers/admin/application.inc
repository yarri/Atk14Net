<?
class ApplicationController extends Atk14Controller{
	function access_forbidden(){
		$this->response->forbidden(_("You don't have permission to access the admin section."));
		$this->render_template = false;
	}

	function _initialize(){
		$this->dbmole = &PgMole::GetInstance();

		$this->_prepend_before_filter("application_before_filter");
		$this->_append_after_filter("application_after_filter");

		if(!$this->rendering_component){
			$this->_prepend_before_filter("begin_database_transaction");
			$this->_append_after_filter("end_database_transaction");
		}
	}

	function _application_before_filter(){
		if(!($this->user = User::ById($this->session->g("user_id"))) || !$this->user->isAdmin()){
			$this->_execute_action("access_forbidden");
		}
		$this->return_uri = $this->params->defined("return_uri") ? $this->params->g("return_uri") : "";
		$this->page_title = _("Administration");
	}

	function _application_after_filter(){

	}

	function _begin_database_transaction(){
		$this->dbmole->begin();
	}

	function _end_database_transaction(){
		$this->dbmole->commit();
	}

	function _before_render(){
		$this->tpl_data["user"] = $this->user;
		if(isset($this->form)){
			$this->form->set_hidden_field("return_uri",($this->params->defined("return_uri") ? $this->params->g("return_uri") : $this->request->getHttpReferer()));
		}
	}
}
?>
