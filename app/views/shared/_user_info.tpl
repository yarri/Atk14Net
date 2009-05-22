<div>
{if $user}
	{t login=$user->g("login")}You are now logged as %1{/t}
	({a controller=users action=logout}{t}Logout{/t}{/a})
{else}
	{t}You are not logged in{/t}
	{a controller=users action=login}{t}Login{/t}{/a} or {a controller=users action=signup}Signup{/a}
{/if}
</div>
