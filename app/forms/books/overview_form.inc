<?
class OverviewForm extends ApplicationForm{
	function set_up(){
		$this->set_method("get");
		$this->add_field("search",new CharField(array(
			"required" => false,
		)));
	}
}
