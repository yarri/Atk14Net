<?
class SortableBooksController extends ApplicationController{
	function index(){ $this->_redirect_to_action("overview"); }

	function overview(){
		$max_amount = 10;
		$conditions = array();
		$bind_ar = array();

		if($d = $this->form->validate($this->params)){
			if($d["search"]){
				$conditions[] = "UPPER(title) LIKE UPPER(:search)";
				$bind_ar[":search"] = "%$d[search]%";
			}
			if($d["code"]){
				$conditions[] = "UPPER(code) LIKE UPPER(:code)";
				$bind_ar[":code"] = "%$d[code]%";
			}
		}

		$sorting = new Atk14Sorting($this->params);
		$sorting->add("title",array("title" => "Sort by a title","order_by" => "UPPER(title)"));
		$sorting->add("code",array("title" => "Sort by a code"));

		$finder = inobj_TableRecord::Finder(array(
			"class_name" => "Book",
			"conditions" => $conditions,
			"bind_ar" => $bind_ar,
			"order" => $sorting->getOrder(),
			"limit" => $max_amount,
			"offset" => $this->params->getInt("from"),
		));

		$this->tpl_data["total_amount"] = $finder->getRecordsCount();
		$this->tpl_data["books"] = $finder->getRecords();
		$this->tpl_data["max_amount"] = $max_amount;

		// don't forget to push $sorting into the template
		$this->tpl_data["sorting"] = $sorting;
	}
}
