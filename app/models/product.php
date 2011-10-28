<?
class Product extends ApplicationModel{
	function Product(){
		parent::ApplicationModel("products");
	}
	
	function ByCategory($category,$lang = null){
		$dbmole = &ApplicationModel::GetDbmole();
		return Product::ById($dbmole->selectIntoArray("SELECT product_id FROM product_categories WHERE category_id=:category_id ORDER BY ranking",array(":category_id" => $category)));
	}

	function getTitle(){ return $this->g("title_$this->lang"); }
	function getShortInfo(){ return $this->g("short_info_$this->lang"); }
	function getLongInfo(){ return $this->g("long_info_$this->lang"); }
	function getActionInfo(){ return $this->g("action_info_$this->lang"); }
	function getPrice(){ return $this->g("price"); }
	function getOldPrice(){ return $this->g("old_price"); }
}
