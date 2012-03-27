<blockquote><span>{$mod}<sup>*</sup></span></blockquote>
<img src="{$public}images/atk14.gif" alt="ATK14 Birdie" title="ATK14 Birdie" />

<p>
<sup>*</sup> The official ATK14 mascot rulez!
</p>

<h3>We develop tools</h3>

<img src="{$public}images/easy_to_use.jpg" alt="Web developper" title="Using ATK14 is such a fun" />

<p>
	We are our tools believers. If you are brave enough you can believe in our tools too.
</p>

<h3>Important links</h3>

<ul>
	<li><a href="http://book.atk14.net/">ATK14 Book</a></li>
	<li><a href="http://api.atk14.net/">API Reference</a></li>
	<li><a href="https://github.com/yarri/Atk14">ATK14 Home on Github</a></li>
	<li><a href="https://github.com/yarri/Atk14/tree/master/installation">ATK14 installation instructions</a></li>
</ul>


<h3>Here are some life examples</h3>

<p>
	At any page you can inspect sources of all involved files
</p>

<ul>
	<li>
		<h4>{a controller=books}CRUD{/a}</h4>
		<p>
			A typical example of displaying (with sorting) / creating / editing / destroying records in a record set
		</p>
	</li>

	<li>
		<h4>{a controller=links}Links{/a}</h4>
		<p>
			How one can create a link to somewhere...
		</p>
	</li>

	<li>
		<h4>{a controller=remote_links}Remote links{/a}</h4>
		<p>
			A few examples of XHR links
		</p>
	</li>

	<li>
		<h4>Forms</h4>
		<ul>
			<li>{a controller=money_transfers action=create_new}CSRF protected form{/a}</li>
			<li>{a controller=big_file_uploads action=create_new}Chunked file upload{/a}</li>
			<li>Field examples
				<ul>
					<li>{a controller=fields action=char_field}Character field{/a}</li>
					<li>{a controller=fields action=email_field}E-mail field{/a}</li>
					<li>{a controller=fields action=date_field}Date field{/a}</li>
					<li>{a controller=fields action=boolean_field}Boolean field{/a}</li>
					<li>{a controller=fields action=multiple_choice_field}Multiple choice field{/a}</li>
					<li>{a controller=fields action=regex_field}Regex field{/a}</li>
					<li>{a controller=fields action=file_field}File field{/a}</li>
					<li>{a controller=fields action=image_field}Image field{/a}</li>
				</ul>
			</li>
			<li>Custom Fields
				<ul>
					<li>{a controller=fields action=odd_number_field}Odd number field{/a}</li>
					<li>{a controller=fields action=url_field}URL field{/a}</li>
				</ul>
			</li>

			<li>Sign up procedure examples
				<ul>
					<li>{a controller=sign_up action=sign_up}Classic{/a}</li>
					<li>{a controller=sign_up_multistep action=sign_up}Multisptep{/a}</li>
					<li>{a controller=sign_up_js_validation action=sign_up}With Javascript validation{/a}</li>
				</ul>
			</li>
		</ul>
	</li>

	<li>
		<h4>{a controller=reminders action=create_new}Sending emails{/a}</h4>
		<p>Sending emails with ApplicationMailer</p>
	</li>
</ul>


