<?
class BooksController extends ApplicationController{

	function overview(){
		$max_amount = 10;
		$conditions = array();
		$bind_ar = array();

		if($d = $this->form->validate($this->params)){
			if($d["search"]){
				$conditions[] = "UPPER(title) LIKE UPPER(:search)";
				$bind_ar[":search"] = "%$d[search]%";
			}
		}

		$finder = inobj_TableRecord::Finder(array(
			"class_name" => "Book",
			"conditions" => $conditions,
			"bind_ar" => $bind_ar,
			"order" => "UPPER(title)",
			"limit" => $max_amount,
			"offset" => $this->params->getInt("from"),
		));

		$this->tpl_data["total_amount"] = $finder->getRecordsCount();
		$this->tpl_data["books"] = $finder->getRecords();
		$this->tpl_data["max_amount"] = $max_amount;
	}

	function _before_filter(){
		$this->doc_source_files[] = "models/book.inc";
	}
}
