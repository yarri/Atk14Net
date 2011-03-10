<?
class RemoteLinksController extends ApplicationController{
	function index(){
	}

	function change_inner_html(){
		$this->tpl_data["current_datetime"] = date("Y-m-d H:i:s");
	}

	function change_box_color(){
		$this->tpl_data["color"] = "#".dechex(rand(0,15)).dechex(rand(0,15)).dechex(rand(0,15));
	}

	function destroy(){
		if($this->request->post()){
			$id = $this->params->getInt("id");
			// put some destroying code here, like..
			//  $item = Item::GetInstanceByt($id);
			//  $item->destroy();
		}
	}

	function get_json(){
		$this->_render(array(
			"text" => json_encode(array("id" => 123, "title" => "ATK14 Brochure", "description" => "The definite brochure for fearless guys!"))
		));
	}


	function _before_filter(){
		// all actions except index must be accessed with asynchronous javascript requests
		if($this->action!="index" && !$this->request->xhr()){
			$this->_execute_action("error404");
		}

		$this->doc_source_files[] = "views/remote_links/change_inner_html.xhr.tpl";
		$this->doc_source_files[] = "views/remote_links/change_box_color.xhr.tpl";
		$this->doc_source_files[] = "views/remote_links/destroy.xhr.tpl";
	}
}
