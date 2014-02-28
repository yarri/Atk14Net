<?php
/**
 * Provides Messages of the Day
 */
class Motd {

	/**
	 * echo Motd::GetMessage();
	 * echo Motd::GetMessage("2012-04-11");
	 */
	static function GetMessage($date = null){
		if(!$date){ $date = date("Y-m-d"); }

		$time = strtotime($date);

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
			ATK14? Sounds like a gun or something...
			ATK14? Is it dangerous?
			ATK14? You shouldn't hack ATK14 core or God kills a Drupal core developer!
			ATK14? Pure quality! No more, no less...
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
			ATK14? Redefines the quantity!
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
			ATK14? There is only a few things as good as ATK14 is. No doubt.
			ATK14? No worries!
			ATK14? Why the hell ATK14? Because ATK has been already taken.
			ATK14? You either work with ATK14 or you don't work with ATK14! There is no other option.
			ATK14? It does nothing by default!
			ATK14? Why it has to be written in ATK14?
			ATK14? It always looks the same to me. Just Great!
			ATK14? Birdie has balls of steel!
			ATK14? Never stops to surprise me!
			ATK14? ATK15? ATK16? ATK17? Who dares to stop that?
			ATK14? For Christ sakes!
			ATK14? Fork the bitch on Github!
			ATK14? Good guess, but wrong.
			ATK14? Meant to be a replacement for every other framework!
			ATK14? Meant to be replaced by every other framework!
			ATK14? Why are you here?
			ATK14? Oh please not today!
			ATK14? Brighter Than the Sun!
			ATK14? Kick the beast ass!
			ATK14? Beware the Birdie at night!
			.atk14 { display: none; }
			ATK14? Best not viewed on any browser!
			ATK14? Really wrath-of-God type of stuff!
			ATK14? That would have worked if you hadn’t stopped me!
			ATK14? Forty years of darkness. Earthquakes, volcanoes...
			ATK14? Listen! Do you smell something?
			ATK14? He slimed me!
			ATK14? Isn't this a mistace?
			ATK14? Are you sure that there is no a better choice?
			ATK14? You fool. No man can kill me. Die now!
			ATK14? I do not believe this darkness will endure!
			ATK14? Birdie lives...
			ATK14? I think this has gone too far!
			ATK14? The light at the end of the tunnel!
			ATK14? I don't think someone takes it seriously!
			ATK14? This time I'm gonna make it!
			ATK14? Relax! It's ATK14!
			ATK14? This is big. This is very big. There is definitely something here!
			ATK14? Concentrate... I want you to tell me what you think it is.
			ATK14? Yep! That's my name!
			ATK14? Sounds like a cryptic evil machine!
			ATK14? Has no mercy!
			ATK14? Certainly this shouldn't exist!
			ATK14? I see no light in the tunnel!
			ATK14? I feel like beer today!
			ATK14? Well, I'm happy to disappoint you.
			ATK14? I knew you'd come!
			ATK14? Don't argue with him!
			ATK14? I used to think it's a big fake!
			ATK14? No matter what it is. I want it!
			ATK14? Good luck with that!
			ATK14? $ ./scripts/destroy_it_all --force --no-confirmation --no-asking --forever --now
			ATK14? Nothing happens! Seriously!
			ATK14? It's not what it looks like!
			ATK14? It's EXACTLY what it looks like!
			ATK14? At least you tried!
			ATK14? Well, then we're wrong!
			ATK14? Finish it, Palmer!
			ATK14? Better luck next time!
			ATK14? I'm back and stronger than ever!
		"));
		return trim($mods[floor($time/(60*60*24))%sizeof($mods)]);
	}
}
