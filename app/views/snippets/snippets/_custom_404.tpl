<h3>Custom 404 Page</h3>

<ul>

<li>
<h4>Application Controller</h4>
{code}
<?php
// file: app/controllers/application.php
class ApplicationController extends Atk14Controller{
	function error404(){
		$this->template_name = "application/error404";
		$this->response->setStatusCode(404);
		$this->page_title = "Error 404: Not Found";
	}
}
{/code}
</li>

<li>
<h4>Template</h4>
{code}{literal}
{* file: app/views/application/error404.tpl *}

<h2>{$page_title}</h2>

<p>We are unable to find a content for <em>{$request->getRequestUri()|h}</em></p>
{/literal}{/code}
</li>

<li>
<h4>Books Controller</h4>
{code}{literal}<?php
// file: app/controllers/books_controller.php
class BooksController extends ApplicationController{
  function detail(){
    if(!$this->tpl_data["book"] = Book::FindById($this->params->getInt("id"))){
			$this->_execute_action("error404");
			return;
		}
  }
}{/literal}{/code}
</li>
</ul>
