<?php
class BigFileUploadsController extends ApplicationController{
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
				if(!$filename = $this->session->g("chunked_upload_$token")){ return $this->_execute_action("error500"); }
				$f = fopen($filename,"ab");
				fwrite($f,$file->getContent(),$file->getFileSize());
				unlink($file->getTmpFileName()); // smazani tohoto chunku
				if(!$file->lastChunk()){
					// exports nothing
					$this->render_template = false;
					return;
				}
			}else{
				$filename = $file->getTmpFileName();
			}

			$this->tpl_data["filename"] = $file->getFilename();
			$this->tpl_data["filesize"] = filesize($filename);
			$this->tpl_data["checksum"] = `md5sum $filename | cut -d ' ' -f 1`; // getting md5 sum of an uploaded file, using the system comman since the file may be really big
			$this->tpl_data["uploaded"] = true;

			unlink($filename);
		}
	}
}
