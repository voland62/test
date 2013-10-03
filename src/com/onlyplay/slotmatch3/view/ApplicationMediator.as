package com.onlyplay.slotmatch3.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import mx.events.DynamicEvent;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view : IApp;
		
		override public function initialize() : void
		{
			log("ApplicationMediator.initialize()");
			addContextListener("state_changes", onStateChanges);
			//addViewListener("underConstruction", function (e:Event):void { dispatch(e); } );
			addViewListener("underConstruction", dispatch);
			addContextListener("init", onInit);
		}

		private function onInit( e:Event ) : void
		{
			view.setGameState( "lobby" );
		}

		private function onStateChanges(e:DynamicEvent) : void
		{
			log("ApplicationMediator.onStateChanges(e)");
			
			view.setGameState( e.state );
			
		}

	}
}
