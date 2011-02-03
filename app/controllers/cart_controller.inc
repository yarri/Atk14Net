<?
class CartController extends ApplicationController{
	function add_product(){
		if(!$product = Product::GetInstanceById($this->params->g("product","integer"))){
			return;
		}
		$this->cart->add($product,$this->params->g("amount","integer"));
	}

	function detail(){
		
	}

	function clear(){
		$this->cart->clear();
		$this->session->clear("cart");
	}
}
