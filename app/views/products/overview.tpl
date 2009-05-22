<h2>{$category->getTitle()}</h2>

<div class="info">
{$category->getInfo()}
</div>

{render partial=overview_item from=$products item=product}
