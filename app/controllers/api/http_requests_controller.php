<?php
class HttpRequestsController extends ApiController {

	/**
	 * ### Lists details of the current HTTP request
	 *
	 * This method can be used for testing ATK14 Framework libraries.
	 */
	function detail(){
		if(!$this->params->isEmpty() && ($d = $this->form->validate($this->params))){

			$this->api_status_code = $d["requested_response_code"] ? $d["requested_response_code"] : 200;

			$request = $this->request;
			
			$headers = [];
			foreach($request->getHeaders() as $name => $value){
				$headers[] = ["name" => $name, "value" => $value];
			}

			$this->api_data = [
				"uri" => $request->getUri(),
				"url" => $request->getUrl(),
				"method" => $request->getMethod(),
				"content_type" => $request->getContentType(),
				"remote_addr" => $request->getRemoteAddr(),
				"remote_port" => $request->getRemotePort(),
				"headers" => $headers,
				"raw_post_data_base64" => base64_encode($request->getRawPostData()),
				"raw_post_data_md5" => md5($request->getRawPostData()),
			];
		}
	}
}
