<?php
/**
 * An example robot which logs a message and then does nothing
 */
class CoolHandRobot extends ApplicationRobot{

	function run(){
		// In here there is access to:
		//
		//	$this->logger
		//	$this->dbmole
		//	$this->mailer
		//	...

		$this->logger->info("The Cool Hand robot is eating eggs");
	}
}
