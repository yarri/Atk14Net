<?
class Book extends inobj_TableRecord{
	function Book(){
		parent::inobj_TableRecord("books");
	}
	
	function CreateNewRecord($values){
		return inobj_TableRecord::_CreateNewRecord("Book",$values);
	}

	function GetInstanceById($id){
		return inobj_TableRecord::_GetInstanceById("Book",$id);
	}

	function getTitle(){ return $this->g("title"); }
	function getCode(){ return $this->g("code"); }
	function getShelfmark(){ return $this->g("shelfmark"); }
}	
