<?php
class BooksController extends ApplicationController{

	/**
	 * Provides the list of books.
	 */
	function index(){
		$this->page_title = "Listing books";

		// initialize sorting
		$this->sorting->add("title","UPPER(title)");
		$this->sorting->add("author","UPPER(author), UPPER(title)","UPPER(author) DESC, UPPER(title) DESC");
		$this->sorting->add("code");

		// validate input parameters
		if(!($d = $this->form->validate($this->params))){
			return;
		}

		// build conditions
		$conditions = array();
		$bind_ar = array();
		if($d["search"]){
			$conditions[] = "UPPER(title||author||code||shelfmark) LIKE UPPER(:search)";
			$bind_ar[":search"] = "%$d[search]%";
		}

		$this->tpl_data["finder"] = Book::Finder(array(
			"conditions" => $conditions,
			"bind_ar" => $bind_ar,
			"order" => $this->sorting,
			"limit" => 10,
			"offset" => $this->params->getInt("offset"),
		));
	}

	/**
	 * Provides detail of a book in various formats
	 */
	function detail(){
		$this->page_title = sprintf("Detail of the book %s",$this->book->getTitle());
		$this->breadcrumbs[] = $this->book->getTitle();

		// Book object is passed to the template in _before_filter() by calling _find_book()

		// returning the book in a different format
		if($format = $this->params->getString("format")){
			switch($format){
				case "xml":
					$content_type = "text/xml";
					$content = $this->book->toXml();
					break;
				case "json":
					$content_type = "text/plain";
					$content = $this->book->toJson();
					break;
				case "yaml":
					$content_type = "text/plain";
					$content = $this->book->toYaml();
					break;
				default:
					$this->_execute_action("error404");
					return;
			}

			$this->render_template = false;
			$this->response->setContentType($content_type);
			$this->response->writeln($content);
		}
	} 
	
	/**
	 * Provides a book entry creation.
	 */
	function create_new(){
		$this->page_title = "Create a new book entry";
		$this->_add_return_uri($this->form);

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			Book::CreateNewRecord($d);
			$this->flash->notice("A new book entry was just created.");
			$this->_go_to_return_uri();
		}
	}

	/**
	 * Provides a book entry editing.
	 */
	function edit(){
		$this->page_title = sprintf("Edit book #%s",$this->book->getId());
		$this->breadcrumbs[] = [$this->book->getTitle(),["action" => "detail", "id" => $this->book->getId()]];
		$this->breadcrumbs[] = "Editing book";

		$this->_add_return_uri($this->form);

		$this->form->set_initial($this->book->getValues());
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$this->book->s($d);
			$this->flash->notice("The book has been updated.");
			$this->_go_to_return_uri();
		}
	}

	/**
	 * Provides a book entry destroying.
	 */
	function destroy(){
		if(!$this->request->post()){ return $this->_execute_action("error404"); }
		
		$this->book->destroy();
	}

	/**
	 * Finds and instantiates an Book object by the parametr id.
	 */
	function _find_book(){
		if($this->book = Book::GetInstanceById($this->params->getInt("id"))){
			$this->tpl_data["book"] = &$this->book;
			return $this->book;
		}
	}

	/**
	 * Adds return uri to a form.
	 */
	function _add_return_uri(&$form){
		$return_uri = $this->request->get() ? $this->request->getHttpReferer() : $this->params->getString("return_uri");
		$form->set_hidden_field("return_uri",$return_uri);
	}

	function _go_to_return_uri(){
		if($return_uri = $this->params->getString("return_uri")){
			return $this->_redirect_to($return_uri);
		}
		$this->_redirect_to_action("index");
	}

	function _before_filter(){
		$this->doc_source_files[] = "app/models/book.php";

		// we need a book in certanin actions
		if(in_array($this->action,array("detail","edit","destroy")) && !$this->_find_book()){
			return $this->_execute_action("error404");
		}

		if($this->action=="index"){
			$this->breadcrumbs[] = "Books";
		}else{
			$this->breadcrumbs[] = ["Books","books/index"];
		}
	}
}
