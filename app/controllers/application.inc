<?
class ApplicationController extends Atk14Controller{
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
		$this->user = User::ById($this->session->g("user_id"));
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

	function _before_render(){
		$this->tpl_data["user"] = $this->user;
		$this->tpl_data["cart"] = $this->cart;
	}
}
?>
