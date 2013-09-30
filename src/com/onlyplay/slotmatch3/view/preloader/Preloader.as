package com.onlyplay.slotmatch3.view.preloader {
	
	import flash.display.*;
	import mx.preloaders.DownloadProgressBar;
	import flash.events.Event;
	//import mx.core.FlexSprite;
	import mx.core.IVisualElement;

	public class Preloader extends Sprite {

		 
		
		
		public function Preloader()
		{
			graphics.beginFill(0xff0000);
			graphics.drawRect(0, 0, 760, 658);
			graphics.endFill();
			
			addEventListener("lobby:first_map_ready", onComplete2)
		}
	
		
		
		
		private function onComplete2():void {
			trace (2)
		}
		
		
		
		
	}
}