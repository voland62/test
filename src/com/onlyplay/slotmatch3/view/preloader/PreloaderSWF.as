package com.onlyplay.slotmatch3.view.preloader {
	
	import flash.display.*;
	import flash.events.Event;
	import mx.events.DynamicEvent;
	import flash.events.ProgressEvent;
	//import mx.core.FlexGlobals;
	import flash.utils.setTimeout;
	import mx.preloaders.SparkDownloadProgressBar;
	import flash.geom.Rectangle;
	import com.onlyplay.slotmatch3.MainAndrew;
	
	
	public class PreloaderSWF extends  SparkDownloadProgressBar{

		private var mov:splash_sborka;
		private const lastFrame:uint = 90;
		private const hintTexts:Vector.<String> = Vector.<String>([
			"Посетите магазин, купите бустеры, для того чтобы достигнуть наилучший результат в игре!",
            "Три в ряд позволяет вам умножить свой выигрыш",
            "Амулет - хороший способ заработать больше денег и опыта",
            "Пройдите все локации на три звезды, чтобы стать королем острова"
		]);
		
		
		
		public function PreloaderSWF(){
			init();
		}
		
		private function init():void {	
			mov = new splash_sborka();
			mov.prldr_text.text = ""
			mov.gotoAndStop(1);
			mov.prldr_text.text = hintTexts[GetRandomNumber(0, hintTexts.length - 1)]
			
			var Ys:Vector.<int> = Vector.<int>([560, 545, 535, 527])
			mov.prldr_text.y = Ys[mov.prldr_text.numLines - 1];
			
			addChild(mov);
		}
		

		
		override protected function progressHandler (e:ProgressEvent):void{
			var frame:int = int(e.bytesLoaded / e.bytesTotal * lastFrame);
			mov.gotoAndStop(Math.max(frame,1));
		}
	
		
		override protected function completeHandler (event:Event) : void {
			
			mov.gotoAndStop(lastFrame);
			
			//сохраняем данные - они понадобятся второму прелоадеру
			MainAndrew.preloaderText = mov.prldr_text.text;
			MainAndrew.preloaderFrame = lastFrame;
			
		}
		
		//-----------------------utils------------------------------
		private function GetRandomNumber(nMin, nMax):int{
			var nNum:int=Math.floor(Math.random()*(nMax-nMin+1))+nMin;
			return nNum;
		}
	}
}