<h3>Default model values</h3>

<ul>

<li>
<h4>Model</h4>
{code}{literal}
<?php
// file: app/models/article.php
class Article extends ApplicationModel{
	static function CreateNewRecord($values,$options = array()){
		$values = array_merge(array(
			"title" => "New Article",
			"source_id" => Source::DefaultSource(),
			"created_at" => date("Y-m-d H:i:s"),
			"updated_at" => date("Y-m-d H:i:s"),
		),$values);

		return parent::CreateNewRecord($values,$options);
	}
}
{/literal}{/code}
</li>

</ul>
