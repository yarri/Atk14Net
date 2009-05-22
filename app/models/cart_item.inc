<?
class CartItem{
	function CartItem($product,$amount = 1){
		$this->_ProductId = is_object($product) ? $product->getId() : $product;
		$this->_Amount = $amount;
	}
	function getProduct(){
		return Product::ById($this->_ProductId);
	}
	function getAmount(){
		return $this->_Amount;
	}
	function getPrice(){
		$p = $this->getProduct();
		return $p->getPrice() * $this->getAmount();
	}
}
?>
