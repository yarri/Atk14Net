<?
class BooksController extends ApplicationController{
	var $max_amount = 20;
	function overview(){
		$conditions = array();
		$bind_ar = array();

		/*
		$finder = Model::Finder(array(
	
		));
		*/
		
		$this->tpl_data["total_amount"] = $this->dbmole->selectSingleValue("SELECT COUNT(*) FROM books".(sizeof($conditions) ? " WHERE ".join(" AND ",$conditions) : ""),$bind_ar,"integer");

		$this->tpl_data["books"] = Model::FindAll(array(
			"class_name" => "Book",
			"conditions" => $conditions,
			"bind_ar" => $bind_ar,
			"order" => "UPPER(title)",
			"limit" => $this->max_amount,
			"offset" => $this->params->getInt("from"),
		));
	}
}
