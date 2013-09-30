package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;

	import mx.events.DynamicEvent;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class ToSlotMediator extends Mediator
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var view : IToSlot;

		override public function initialize() : void
		{
			
			var win:int = 10;
			var currentMoney:int = 10;
			view.setWin( win , currentMoney );
			
			addViewListener("toMap", onToMap);
		}

		private function onToMap( e:DynamicEvent ) : void
		{
			log("ToMapMediator.onToMap(e)");
			view.dispatchEvent(new Event("close"));
			var event :DynamicEvent = new DynamicEvent("state_changes");
			event.state = "lobby";
			dispatch( event );
		}
	}
}
