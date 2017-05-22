<h1>{$page_title}</h1>

{render partial="article_item" from=$finder->getRecords() item=article}

{paginator}
