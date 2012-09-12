<?php
class ChunkedFileUploadsController extends ApplicationController{
	function create_new(){
		$this->page_title = "Chunked File Upload";

		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$file = &$d["file"];

			if($file->chunkedUpload()){
				$token = $file->getToken();
				if($file->firstChunk()){
					$file->moveToTemp();
					$this->session->s("chunked_upload_$token",$file->getTmpFileName());
					$this->render_template = false;
					return;
				}
				if(!$working_file = $this->session->g("chunked_upload_$token")){ return $this->_execute_action("error500"); }
				$f = fopen($working_file,"ab");
				fwrite($f,$file->getContent(),$file->getFileSize());
				unlink($file->getTmpFileName()); // smazani tohoto chunku
				if(!$file->lastChunk()){
					// exports nothing
					$this->render_template = false;
					return;
				}
			}else{
				$working_file = $file->getTmpFileName();
			}

			$this->tpl_data["filename"] = $file->getFilename();
			$this->tpl_data["filesize"] = filesize($working_file);
			$this->tpl_data["checksum"] = md5_file($working_file);
			$this->tpl_data["uploaded"] = true;

			unlink($working_file);
		}
	}
}
