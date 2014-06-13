<?php
class ChunkedFileUploadsController extends ApplicationController{
	function create_new(){
		$this->page_title = "Chunked File Upload";


		if($this->request->post() && ($d = $this->form->validate($this->params))){
			$file = &$d["file"];


		$content_disposition = $this->request->getHeader("Content-Disposition");
		$content_range = $this->request->getHeader("Content-Range");
		$token = $file->getToken();
		$first = $file->firstChunk() ? "yes" : "no";
		$last = $file->lastChunk() ? "yes" : "no";

		$this->logger->info("Content-Disposition: $content_disposition | Content-Range: $content_range | token: $token | first: $first | last: $last");
		$this->logger->flush();

			if($file->chunkedUpload()){
				$token = $file->getToken();
				if($file->firstChunk()){
					$file->moveToTemp();
					$this->session->s("chunked_upload_$token",$file->getTmpFileName());
					$this->render_template = false;
					$this->response->write("[]");
					return;
				}
				if(!$working_file = $this->session->g("chunked_upload_$token")){ return $this->_execute_action("error500"); }
				$f = fopen($working_file,"ab");
				fwrite($f,$file->getContent(),$file->getFileSize());
				unlink($file->getTmpFileName()); // smazani tohoto chunku
				if(!$file->lastChunk()){
					// exports nothing
					$this->render_template = false;
					$this->response->write("[]");
					//$this->response->write("// middle");
					return;
				}
			}else{
				$working_file = $file->getTmpFileName();
			}

			$this->tpl_data["filename"] = $file->getFilename();
			$this->tpl_data["filesize"] = filesize($working_file);
			$this->tpl_data["checksum"] = md5_file($working_file);
			$this->tpl_data["uploaded"] = true;

			$this->render_template = false;
			$this->response->write(json_encode(array(
				"filename" => $file->getFilename(),
				"filesize" => filesize($working_file),
				"checksum" => md5_file($working_file),
			)));

			unlink($working_file);
		}
	}
}
