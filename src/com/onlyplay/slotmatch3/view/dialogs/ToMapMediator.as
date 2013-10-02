package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;

	import mx.events.DynamicEvent;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class ToMapMediator extends Mediator
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var view : IToMap;

		override public function initialize() : void
		{
			var win:int = gameModel.win;
			var currentMoney:int = gameModel.userInfo.money;
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
