<h2>Remote links</h2>

<h3>Example 1: Changing inner HTML</h3>
<p>
{a_remote action=change_inner_html}Click to change inner HTML{/a_remote}<br />
</p>
<pre>
<code>\{a_remote action=change_inner_html\}Click to change inner HTML\{/a_remote\}</code>
</pre>

<h3>Example 2: Changing inner HTML with confirmation message</h3>
<p>
{a_remote action=change_inner_html _confirm="Are you sure to change the inner HTML?"}Click to change inner HTML with confirmation{/a_remote}<br />
</p>
<pre>
<code>\{a_remote action=change_inner_html _confirm="Are you sure to change the inner HTML?"\}Click to change inner HTML with confirmation\{/a_remote\}</code>
</pre>

<h3>Example 3: Changing the box color</h3>
<div style="width: 5em; height: 2em; background-color: yellow; border: 2px solid black;">&nbsp;</div>
<p>
{a_remote action=change_box_color}Click to change the box color{/a_remote}<br />
</p>
<pre>
<code>\{a_remote action=change_box_color\}Click to change the box color\{/a_remote\}</code>
</pre>

<h3>Example 4: Destroying an item</h3>
<p>
{a_remote action=destroy id=123 _method=post _confirm="Are you sure to delete the #123 item?"}Destroy item no #123 (method POST &amp; confirmation involved){/a_remote}<br />
</p>
<pre>
<code>\{a_remote action=destroy id=123 _method=post _confirm="Are you sure to delete the #123 item?"}Destroy item no #123 (method POST &amp; confirmation involved)\{/a_remote\}</code>
</pre>

<h3>Example 5: Destroying an item with a_destroy helper</h3>
<p>
{a_destroy id=123 _confirm="Are you sure to delete the #123 item?"}Destroy item no #123 (better than the previous sample){/a_destroy}<br />
</p>
<pre>
<code>\{a_destroy id=123 _confirm="Are you sure to delete the #123 item?"\}Destroy item no #123 (better than the previous sample)\{/a_destroy\}</code>
</pre>

<h3>Example 6: Retrieving a JSON</h3>
<p>
{a_remote action=get_json id=123 _data-type=json _id=json_link}Get JSON{/a_remote}<br />
</p>
<pre>
<code>\{a_remote action=get_json id=123 _data-type=json _id=json_link\}Get JSON\{/a_remote\}</code>
</pre>
