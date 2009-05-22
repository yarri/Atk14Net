<?
class CreateNewForm extends ApplicationForm{
	function set_up(){
		$this->add_field("catalog_id",new CharField(array(
			"title" => _("Catalog Number"),
			"max_length" => 255
		)));

		$this->add_field("title_cs",new CharField(array(
			"title_cs" => _("Title (in czech)"),
			"max_length" => 255
		)));

		$this->add_field("title_en",new CharField(array(
			"title_cs" => _("Title (in english)"),
			"max_length" => 255
		)));

		$this->add_field("short_info_cs",new CharField(array(
			"short_info_cs" => _("Short Info (in czech)"),
			"widget" => new TextArea(),
			"required" => false
		)));

		$this->add_field("short_info_en",new CharField(array(
			"short_info_cs" => _("Short Info (in english)"),
			"widget" => new TextArea(),
			"required" => false
		)));

		$this->add_field("long_info_cs",new CharField(array(
			"long_info_cs" => _("Short Info (in czech)"),
			"widget" => new TextArea(),
			"required" => false
		)));

		$this->add_field("long_info_en",new CharField(array(
			"long_info_cs" => _("Short Info (in english)"),
			"widget" => new TextArea(),
			"required" => false
		)));
	}
}
?>
