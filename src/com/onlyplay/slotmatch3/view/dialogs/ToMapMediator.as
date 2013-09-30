package com.onlyplay.slotmatch3.view.dialogs
{
	import mx.events.DynamicEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;

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
			
			var win:int = 10;
			var currentMoney:int = 10;
			view.setWin( win , currentMoney );
			
			addViewListener("toMap", onToMap);
		}

		private function onToMap( e:DynamicEvent ) : void
		{
			
		}
	}
}
