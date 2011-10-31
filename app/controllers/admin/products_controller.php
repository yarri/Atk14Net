<?php
class ProductsController extends ApplicationController{
	function overview(){
		$sorting = new Atk14Sorting($this->params);
		$sorting->add("title_en",array("title" => _("Sort by Title")));
		$sorting->add("title_cs",array("title" => _("Sort by Title")));
		$sorting->add("created_at",array("title" => _("Sort by date of registration")));

		$this->tpl_data["total_amount"] = $this->dbmole->selectSingleValue("SELECT COUNT(*) FROM products");
		$this->tpl_data["max_amount"] = 40;
		$this->tpl_data["products"] = Model::FindAll(array(
			"class_name" => "Product",
			"order" => $sorting->getOrder(),
			"limit" => 40,
			"offset" => isset($d["from"]) ? $d["from"] : 0
		));
		$this->tpl_data["sorting"] = $sorting;
	}

	function create_new(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$p = Product::CreateNewRecord($d);
			$this->flash->notice("A new product has been created successfuly.");
			$this->_redirect_to($this->return_uri);
		}
	}

	function edit(){
		$this->form->set_initial($this->product->getValues());
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$this->product->s($d);
			$this->flash->notice("The product has been updated successfuly.");
			$this->_redirect_to($this->return_uri);
		}
	}

	function _before_filter(){
		$this->page_title = _("Products");
		$this->product = $this->tpl_data["product"] = Product::ById($this->params->g("id","integer"));
	}
}
