<h3>{$product->getTitle()}</h3>

<div>
{$product->getShortInfo()}
</div>

<div>
{$product->getLongInfo()}
</div>

<div>
{$product->getActionInfo()}
</div>

<div>
{$product->getPrice()}
{if $product->getOldPrice()} <del>{$product->getOldPrice()}</del> {/if}
</div>

<form action="{link_to controller=cart action=add_product product=$product}" method="post">
	<input type="text" name="amount" value="1" />
	<input type="submit" value="{t}Add to cart{/t}" />
</form>
