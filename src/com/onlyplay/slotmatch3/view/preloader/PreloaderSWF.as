package com.onlyplay.slotmatch3.view.preloader {
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import mx.core.FlexGlobals;
	import flash.utils.setTimeout;
	import mx.preloaders.SparkDownloadProgressBar;
	import flash.geom.Rectangle;
	
	public class PreloaderSWF extends  SparkDownloadProgressBar{

		/*private var bTimeExpired:Boolean = false;
		private var bContentReady:Boolean = false;
		private const MIN_TIME:uint = 3000;
		*/
		private var mov:splash_sborka;
		
		
		public function PreloaderSWF(){
			init();
		}
		
		private function init():void {	
			mov = new splash_sborka();
			mov.gotoAndStop(1);
			addChild(mov);
		}
		

		
		override protected function progressHandler (e:ProgressEvent):void{
			mov.gotoAndStop(int(e.bytesLoaded / e.bytesTotal * 50));
			
		}
	
		
		override protected function completeHandler (event:Event) : void {
			mov.gotoAndStop(50);
		}
		
		
		
		
		
		
		
		
		
		
	}
}