package com.onlyplay.slotmatch3.view.preloader {
	
	import flash.display.*;
	import flash.events.Event;
	import mx.core.FlexGlobals;
	import flash.utils.setTimeout;
	
	public class Preloader extends Sprite {

		private var bTimeExpired:Boolean = false;
		private var bContentReady:Boolean = false;
		private const MIN_TIME:uint = 3000;
		
		private var mov:splash_sborka;
		
		
		public function Preloader()
		{
			init();
		}
		
		private function init():void {
			/*graphics.beginFill(0xff0000);
			graphics.drawRect(0, 0, 760, 658);
			graphics.endFill();
			setTimeout(TimeExpired, MIN_TIME)*/
			
			mov = new splash_sborka();
			mov.gotoAndStop(50);
			addChild(mov);
		}
		
		
		/*private function TimeExpired():void {
			bTimeExpired = true;
			//HideTest();
		}*/
		
		internal function ContentReady():void {
			
			mov.gotoAndStop(100);
			bContentReady = true;
			setTimeout(HideTest, 1000);
		}
		
		private function HideTest():void {
			//if (bTimeExpired && bContentReady) {
				
				var top:*= FlexGlobals.topLevelApplication;
				var obj:Object = top.getObjById("prldrHolder");
				top.removeElement(obj);
				obj = null;
		
			//}
		}
		
		
		
		
		
		
	}
}