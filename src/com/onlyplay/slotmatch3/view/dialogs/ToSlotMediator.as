package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.BoosterTimerService;
	import com.onlyplay.slotmatch3.services.MatchEnergyFallingService;
	import com.onlyplay.slotmatch3.services.MatchTimerService;

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
		[Inject]
		public var matchTimeService : MatchTimerService;
		[Inject]
		public var energyFallingService : MatchEnergyFallingService;
		[Inject]
		public var boosterTimerService : BoosterTimerService;

		override public function initialize() : void
		{
			var win : int = gameModel.win;
			var currentMoney : int = gameModel.userInfo.money;
			view.setWin(win, currentMoney);
			addViewListener("close", onClose);
			addViewListener("toSlot", onToSlot);

			matchTimeService.pause();
			energyFallingService.pause();
			boosterTimerService.pause();
		}

		private function onClose(e : Event) : void
		{
			matchTimeService.resume();
			energyFallingService.resume();
			boosterTimerService.resume();
		}

		private function onToSlot(e : DynamicEvent) : void
		{
			log("ToMapMediator.onToMap(e)");
			removeViewListener("close", onClose);
			
			dispatch(e);
			
			view.dispatchEvent(new Event("close"));
//			var event : DynamicEvent = new DynamicEvent("state_changes");
//			event.state = "lobby";
//			dispatch(event);
		}
	}
}
