package com.onlyplay.slotmatch3.view.preloader {
	
	import flash.display.*;
	import flash.events.Event;
	import mx.core.FlexGlobals;
	import flash.utils.setTimeout;
	import com.onlyplay.slotmatch3.MainAndrew;
	
	public class Preloader extends Sprite {

		//private var bTimeExpired:Boolean = false;
		private var bContentReady:Boolean = false;
		private const MIN_TIME:uint = 3000;
		
		private var mov:splash_sborka;
		
		
		public function Preloader()
		{
			init();
		}
		
		
		
		private function init():void {
			mov = new splash_sborka();
			//mov.gotoAndStop(MainAndrew.preloaderFrame);
			mov.gotoAndStop(90)
			//mov.prldr_text.text = MainAndrew.preloaderText;
			mov.prldr_text.text = "Амулет - хороший способ заработать больше денег и опыта";
			
			var Ys:Vector.<int> = Vector.<int>([560, 545, 535, 527])
			
			mov.prldr_text.y = Ys[mov.prldr_text.numLines - 1];
			
			
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