package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.MatchTimerService;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class TimeOverPopupMediator extends Mediator
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var matchModel : MatchGameModel;
		[Inject]
		public var view : ITimeOverPopup;
		[Inject]
		public var timerService : MatchTimerService;

		override public function initialize() : void
		{
			log("------TimeOverPopupMediator.initialize()");
			view.addEventListener("toSlot", onToSlot);
			view.addEventListener("buyTime", onBuyTime);
			
			
			var nextLevelMultiplyer:Number;
			
			var index : int = matchModel.matchModelProto.levels.indexOf(matchModel.currentLevel);
			var nextLevel :MatchLevelProtobuf = matchModel.matchModelProto.levels[index + 1];
			if ( nextLevel ) nextLevelMultiplyer = nextLevel.multiplier;
			
			view.init( gameModel.win, matchModel.currentLevel.multiplier, matchModel.matchModelProto.time, nextLevelMultiplyer );
			
		}

		private function onBuyTime(e : Event) : void
		{
			view.dispatchEvent(new Event("close"));
			// TODO: may be bring this in the separate command - because this behaviour useed in many places
			matchModel.flashEnergyState = MatchGameModel.FLASH_ENERGY_FREEZE;
			
			matchModel.startTime = matchModel.currentTime + matchModel.matchModelProto.time;
			timerService.start();
			
			
		}

		private function onToSlot(e : Event) : void
		{
			view.dispatchEvent(new Event("close"));
			dispatch(new Event ("toSlot"));
		}
	}
}
