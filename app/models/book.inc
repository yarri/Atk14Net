<?
class Book extends Model{
	function Book(){
		parent::Model("books");
	}
	
	function CreateNewRecord($values){
		return Model::_CreateNewRecord("Book",$values);
	}

	function ById($id){
		return Model::_GetInstanceById("Book",$id);
	}

	function getTitle(){ return $this->g("title"); }
	function getCode(){ return $this->g("code"); }
	function getShelfmark(){ return $this->g("shelfmark"); }
}	
