<?php
class MainController extends ApplicationController{
	function index(){
		$this->page_title = "Welcome";

		// every day a new message
		$mods = explode("\n",trim("
			ATK14? The best is just a weak expression!
			ATK14? The thing you should be afraid of!
			ATK14? The last thing you'll see!
			ATK14? Forget it!
			ATK14? Who cares?
			AKT14? No! It's ATK14.
			ATK14? The last framework!
			ATK14? The first framework!
			ATK14? Not the 14th framework!
			ATK14? Your headache!
			ATK14? Stay away from the others!
			ATK14? Do not betray the Birdie!
			ATK14? Remember the last pain?
			ATK14? So what?
			ATK14? Sounds like a gun or something.
			ATK14? Is it dangerous?
			ATK14? You shouldn't hack ATK14 core or God kills a Drupal core developer!
			ATK14? Nothing else than pure quality!
			ATK14? Take it or leave it!
			ATK14? The Birdie is gonna hit ya!
			ATK14? The Birdie is gonna die for you!
			ATK14? Do not trust the Birdie!
			ATK14? Birdie is seeing you! Probably.
			ATK14? Better to use Brainfuck next time!
			ATK14? Lets celebrate the 0.1 release!
			ATK14? Let the Bird control your body!
			ATK14? Follow the White Birdie!
			ATK14? The Birdie hits the fan!
			ATK14? Don't even think about it!
			ATK14? Redefines the quality!
			ATK14? Are you kidding?
			ATK14? Are you sure?
			ATK14? Better to do it in Perl!
			ATK14? Have never heard about a worse framework!
			ATK14? The Birdie works for me!
			ATK14? The Birdie works against me!
			ATK14? There ain't no power to stop the Birdie!
			ATK14? Birdie's got a temper!
			ATK14? The ideal framework for refrigerators!
			ATK14? A glitch in the Matrix!
			ATK14? The Matrix itself!
			ATK14? Wow! Look at all the crazy stuff here!
			ATK14? There is only a few things as good as ATK14 is. No doupt.
			ATK14? No worries!
		"));
		$this->tpl_data["mod"] = trim($mods[floor(time()/(60*60*24))%sizeof($mods)]);
	}
}