<?php
class BooksController extends ApplicationController{

	/**
	* Provides the list of books.
	*/
	function index(){
		$this->page_title = "Books";

		$this->sorting->add("title",array("order_by" => "UPPER(title)"));
		$this->sorting->add("code");

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

		$finder = Book::Finder(array(
			"conditions" => $conditions,
			"bind_ar" => $bind_ar,
			"order" => $this->sorting->getOrder(),
			"limit" => 10,
			"offset" => $this->params->getInt("from"),
		));

		$this->tpl_data["books"] = $finder->getRecords();
		$this->tpl_data["finder"] = $finder;
	}

	/**
	* Provides the detail of a book.
	*/
	function detail(){
		$this->page_title = sprintf("Detail of the book %s",$this->book->getTitle());
	} 
	
	/**
	* Provides a book entry creation.
	*/
	function create_new(){
		$this->page_title = "Create a new book entry";

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			Book::CreateNewRecord($d);
			$this->flash->notice("A new book entry was saved.");
			$this->_redirect_to_action("index");
		}
	}

	/**
	* Provides a book entry editing.
	*/
	function edit(){
		$this->page_title = sprintf("Edit book #%s",$this->book->getId());
		$return_uri = $this->request->get() ? $this->request->getHttpReferer() : $this->params->getString("return_uri");
		$this->form->set_hidden_field("return_uri",$return_uri);

		$this->form->set_initial($this->book->getValues());
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$this->book->s($d);
			$this->flash->notice("The entry was updated.");
			$this->_go_to_return_uri();
		}
	}

	/**
	* Provides a book entry destroying.
	*/
	function destroy(){
		if(!$this->request->xhr()){
			$this->flash->error("The requested operation could not be performed without JavaScript.");
			return $this->_redirect_to_action("index");
		}
		if($this->request->post()){
			$this->book->destroy();
		}
	}

	/**
	* Finds and instantiates an Book object by tha parametr id.
	*/
	function _find_book(){
		if($this->book = Book::GetInstanceById($this->params->getInt("id"))){
			$this->tpl_data["book"] = &$this->book;
			return true;
		}
		return false;
	}

	function _go_to_return_uri(){
		if($return_uri = $this->params->getString("return_uri")){
			return $this->_redirect_to($return_uri);
		}
		$this->_redirect_to_action("index");
	}

	function _before_filter(){
		$this->doc_source_files[] = "models/book.inc";

		if(in_array($this->action,array("detail","edit","destroy")) && !$this->_find_book()){
			return $this->_execute_action("error404");
		}
	}
}
