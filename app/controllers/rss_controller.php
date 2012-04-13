<?php
class RssController extends ApplicationController{
	function motds(){
		$items = array();
		$date = Date::Today();
		$counter = 0;
		while($counter<5){
			$items[] = array(
				"title" => Motd::GetMessage($date),
				"pubDate" => $date->toGmdate(),
			);
			$date = $date->minusDay();
			$counter++;
		}


		$this->render_template = false;

		$res = $this->response;
		$res->setContentType("text/xml");
		$res->writeln('<?xml version="1.0" encoding="UTF-8"?>');
		$res->writeln('<rss>');
		$res->writeln('<channel>');
		$res->writeln('<title>ATK14`s Messages of the day</title>');
		$res->writeln('<description>Every day the ATK14 Birdie has an important new message for you</description>');
		$res->writeln("<lang>$this->lang</lang>");
		foreach($items as $item){
			$res->writeln('<item>');
			foreach($item as $key => $value){
				$res->writeln("<$key>".XMole::ToXml($value)."</$key>");
			}
			$res->writeln('</item>');
		}
		$res->writeln('</channel>');
		$res->writeln('</rss>');
	}
}
