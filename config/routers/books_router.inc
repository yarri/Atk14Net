<?php
class BooksRouter extends Atk14Router{
	function recognize($uri){
		if(preg_match('/^\/(book|kniha)\/([0-9]+)-([^.]*)(|\.([a-z]+))$/',$uri,$matches)){
			if(!$book = Book::GetInstanceById($matches[2])){
				$this->_not_found();
				return;
			}

			$this->controller = "books";
			$this->action = "detail";

			$this->lang = $matches[1]=="book" ? "en" : "cs";
			$this->params->add("id",$book);
			$slug = $matches[3];
			if(isset($matches[5])){
				$this->params->add("format",$matches[5]);
			}

			// 
			if($slug!=$book->getSlug()){
				$this->_redirect_to($this->_build_book_link($book));
			}
		}
	}

	function build(){
		if($this->controller!="books"){ return; }

		if($this->action=="detail" && ($book = Book::GetInstanceById($this->params->getInt("id")))){
			return $this->_build_book_link($book);
		}
	}

	function _build_book_link($book){
		$label = $this->lang=="cs" ? "kniha" : "book";
		if($format = $this->params->g("format")){ $format = ".$format"; }

		$this->params->del("format");
		$this->params->del("id");

		return sprintf('/%s/%s-%s%s',$label,$book->getId(),$book->getSlug(),$format);	
	}
}
