<?
class Category extends Model{
	function Category(){
		parent::Model("categories");
	}
	
	function CreateNewRecord($values){
		return Model::_CreateNewRecord("Category",$values);
	}

	function ById($id,$lang = null){
		return Model::Langify(
			Model::_GetInstanceById("Category",$id),
			$lang
		);
	}

	function DefaultCategory($lang = null){
		return Model::Langify(
			Model::FindFirst(array(
				"class_name" => "Category",
				"conditions" => "parent_category_id IS NULL",
				"order" => "ranking",
				"limit" => 1,
			))
		);
	}

	function getTitle(){ return $this->g("title_$this->lang"); }
	function getInfo(){ return $this->g("info_$this->lang"); }

	function correctRanking(){
		$categories = Model::FindAll(array(
			"class_name" => "Category",
			"conditions" => is_null($this->g("parent_category_id")) ? "parent_category_id IS NULL" : "parent_category_id=".$this->g("parent_category_id"),
			"order" => "ranking"
		));
		$expected_ranking = 0;
		foreach($categories as $c){
			if($c->g("ranking")!=$expected_ranking){ $c->s("ranking",$expected_ranking); }
			$expected_ranking += 2;
		}
	}
}
?>
