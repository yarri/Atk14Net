<?php
class ProductsController extends ApplicationController{
	function overview(){
		($category = Category::GetInstanceById($this->params->g("category","integer"))) || ($category = Category::DefaultCategory());
		$this->tpl_data["category"] = $category;
		$this->tpl_data["products"] = Product::ByCategory($category);
		$this->page_title = $category->getTitle();
		$this->page_description = strip_tags($category->getInfo());
	}

	function detail(){
		if(!$product = Product::GetInstanceByById($this->params->g("id","integer"))){ return $this->_redirect_to_action("category"); }
	}
}
