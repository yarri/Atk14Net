<?php
class CategoriesController extends ApplicationController{
	function overview(){
		$this->tpl_data["categories"] = Model::FindAll(array(
			"class_name" => "Category",
			"conditions" => $this->parent ? "parent_category_id=".$this->parent->getId() : "parent_category_id IS NULL",
			"order" => "ranking"
		));

	}
	function create_new(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$d["parent_category_id"] = $this->parent;
			$d["ranking"] = 999;
			$cat = Category::CreateNewRecord($d);
			$cat->correctRanking();
			$this->flash->notice(_("New category was created successfuly."));
			$this->_redirect_to($this->return_uri);
		}
	}

	function edit(){
		$category = Category::ById($this->params->g("id","integer"));
		$this->form->set_initial($category->getValues());
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$category->s($d);
			$this->flash->notice(_("The category was updated successfuly."));
			$this->_redirect_to($this->return_uri);
		}
	}

	function destroy(){
		if($this->request->post()){ $this->category->destroy(); }
		if(!$this->request->xhr()){ $this->_redirect_to_action("overview"); }
	}

	function _before_filter(){
		$this->page_title = _("Categories");
		$this->tpl_data["parent"] = $this->parent = Category::ById($this->params->g("parent_id","integer"));
		$this->tpl_data["category"] = $this->category = Category::ById($this->params->g("id","integer"));
	}
}
