<?php
class FileUploadsController extends ApiController {

	/**
	 * ### Testing method for file upload
	 */
	function create_new(){
		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$file = $d["file"];
			$this->api_data = [
				"filename" => $file->getFilename(),
				"mime_type" => $file->getMimeType(),
				"md5sum" => md5_file($file->getTmpFilename()),
				
			];
		}
	}
}
