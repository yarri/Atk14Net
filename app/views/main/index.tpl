<h3>Welcome</h3>

<img src="{$public}images/atk14.gif" alt="ATK14 Birdie" title="ATK14 Birdie" />

<p>
The official ATK14 mascot is a bit surprised to see you there.
</p>

<h3>Why is it such a fun to use ATK14?</h3>

<img src="{$public}images/easy_to_use.jpg" alt="Web developper" title="Using ATK14 is such a fun" />

<p>
	We simply don't know.
</p>

<blockquote>{$mod}</blockquote>

<p>
&mdash; an atk14 developper
</p>

<h3>Here are some life examples</h3>

<p>
	At any page you can inspect sources of all involved files.
</p>

<ul>
	<li>
		<h4>{a controller=books}CRUD{/a}</h4>
		<p>
			A typical example of displaying (with sorting) / creating / editing / destroying records in a record set.
		</p>
	</li>

	<li>
		<h4>{a controller=remote_links}Remote links{/a}</h4>
		<p>
			A few examples of XHR links.
		</p>
	</li>

	<li>
		<h4>Sign up forms</h4>
		<p>
		A sign up procedure.
		</p>
		<ul>
			<li><h5>{a controller=sign_up action=sign_up}Simple{/a}</h5></li>
			<li><h5>{a controller=sign_up_multistep action=sign_up}Multisptep{/a}</h5></li>
			<li><h5>{a controller=sign_up_js_validation action=sign_up}With Javascript validation{/a}</h5></li>
		</ul>
	</li>

	<li>
		<h4>{a controller=reminders action=create_new}Sending emails{/a}</h4>
		<p>Sending emails with ApplicationMailer</p>
	</li>

	<li>
		<h4>Form</h4>
		<ul>
			<li>
				{a controller=forms action=csrf_protected}CSRF protected form{/a}
			</li>
			<li>Field examples
				<ul>
					<li>{a controller=fields action=email}E-mail field{/a}</li>
					<li>{a controller=fields action=date}Date field{/a}</li>
					<li>{a controller=fields action=boolean}Boolean field{/a}</li>
					<li>{a controller=fields action=multiple_choice}Multiple choice field{/a}</li>
				</ul>
			</li>
		</ul>

	</li>
</ul>

<h3>Important links</h3>

<ul>
	<li><a href="http://book.atk14.net/">ATK14 Book</a></li>
	<li><a href="http://api.atk14.net/">API Reference</a></li>
	<li><a href="https://github.com/yarri/Atk14">ATK14 Home on Github</a></li>
	<li><a href="https://github.com/yarri/Atk14/tree/master/installation">ATK14 installation instructions</a></li>
</ul>




