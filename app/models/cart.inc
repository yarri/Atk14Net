<?
class Cart{
	var $_Items = array();

	function getAmount($product){
		$product = $this->_productToId($product);
		return isset($this->_Items[$product]) ? $this->_Items[$product]->getAmount() : 0;
	}

	function setAmount($product,$amount){
		$product = $this->_productToId($product);
		if($amount<=0){
			return $this->remove($product);
		}
		$this->_Items[$product] = new CartItem($product,$amount);
	}

	function add($product,$amount = 1){
		$this->setAmount($product,$this->getAmount($product) + $amount);
	}

	function remove($product){
		unset($this->_Items[$this->_productToId($product)]);
	}

	function getItems(){
		return array_values($this->_Items);
	}

	function getTotalPrice(){
		$out = 0;
		foreach($this->_Items as $item){
			$out += $item->getPrice();
		}
		return $out;
	}

	function getItemsCount(){
		return sizeof($this->_Items);
	}

	function isEmpty(){ return sizeof($this->_Items)==0; }
	function clear(){ $this->_Items = array(); }

	function _productToId($product){
		return is_object($product) ? $product->getId() : $product;
	}
}
?>
