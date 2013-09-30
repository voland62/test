package com.onlyplay.slotmatch3.view.preloader {
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author smt
	 */
	public class PreloaderMediator extends Mediator {
		
		[Inject]
		public var view : Preloader;
		
		public function PreloaderMediator() {
			addContextListener("lobby:first_map_ready", onReady);
		}
		
		private function onReady(e:Event):void {
			dispatch(e);
		}
		
		
	}

}