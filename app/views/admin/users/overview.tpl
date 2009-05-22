<h2>{t}Users List{/t}</h2>

<table>
<thead>
<tr>
	<th>{t}Id{/t}</th>
	{sortable key=login}<th>{t}Login{/t}</th>{/sortable}
	{sortable key=name}<th>{t}Name{/t}</th>{/sortable}
	<th>{t}E-mail{/t}</th>
	{sortable key=created_at}<th>{t}Created At{/t}</th>{/sortable}
	<th>&nbsp;</th>
</tr>
</thead>
<tbody>
{render partial=overview_item from=$users item=user}
</tbody>
</table>

{paginator}
