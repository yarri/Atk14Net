<header>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-main">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

				{if $controller==main && $action==index}
					<h1 class="navbar-brand">ATK14</h1>
				{else}
					{a controller=main action=index _title="for fearless guys only" _class="navbar-brand"}ATK14 Home{/a}
				{/if}
			</div>

			<div class="collapse navbar-collapse" id="nav-main">
				<ul class="nav navbar-nav">
					<li>{a action="main/about"}What is ATK14?{/a}</li>
					<li><a href="http://api.atk14.net/">API Reference</a></li>
					<li><a href="http://book.atk14.net/">The Book</a></li>
					<li><a href="https://github.com/atk14/Atk14">Source on Github <span class="glyphicon glyphicon-new-window"></span></a></li>
					<li><a href="https://github.com/atk14/Atk14#installation">Installation Instructions <span class="glyphicon glyphicon-new-window"></span></a></li>
					<li><a href="http://www.atk14sites.net/">Who uses ATK14? <span class="glyphicon glyphicon-new-window"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
