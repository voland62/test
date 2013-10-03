package com.onlyplay.slotmatch3.view.preloader {
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	import flash.events.Event;
	
	
	
	
	
	public class PreloaderMediator extends Mediator {
		
		[Inject]
		public var view : Preloader;
		
		override public function initialize() : void{
			addContextListener("lobby:first_map_ready", PreloaderClose)
		}
		
		
		
		private function PreloaderClose(e:Event):void {
			view.ContentReady();
		}
		
		
		
		
	}

}