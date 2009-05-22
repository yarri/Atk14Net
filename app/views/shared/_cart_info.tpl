<div class="cart_info">
{if $cart->isEmpty()}
	{t}Shopping cart is empty.{/t}
{else}
	{t count=$cart->getItemsCount()}%1 items in your cart{/t}
{/if}
</div>
