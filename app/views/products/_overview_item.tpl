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
