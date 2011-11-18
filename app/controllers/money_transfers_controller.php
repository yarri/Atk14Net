<?php
// file app/controllers/money_transfers_controller.php
class MoneyTransfersController extends ApplicationController{

	function create_new(){
		$this->page_title = "New money transfer";

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			// consider that we have a logged user in $this->logged_user variable....
			// $this->_send_money($d["amount"],$this->logged_user->getBankAccount(),$d["bank_account"]);

			$this->flash->success("Congratulation! Your money has been sent!");
			$this->_redirect_to("money_transfers/create_new");
		}
	}

	function _send_money($money_amount,$source_bank_account,$destination_bank_account){
		// TODO: here should be a great bank transfer code
	}
}
