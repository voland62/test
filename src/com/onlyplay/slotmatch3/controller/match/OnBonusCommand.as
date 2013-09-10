package com.onlyplay.slotmatch3.controller.match
{
	import com.onlyplay.slotmatch3.services.MatchEnergyFallingService;

	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.components.games.match.ItemModel;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.MatchTimerService;

	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnBonusCommand extends Command
	{
		[Inject]
		public var model : MatchGameModel;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var event : DynamicEvent;
		[Inject]
		public var timerService : MatchTimerService;

		override public function execute() : void
		{
			switch(event.bonusType)
			{
				case ItemModel.COIN:
					gameModel.currentMoney += 10;
					// TODO: выйгрыш должен прилетель с эвентом
					eventDispatcher.dispatchEvent(new Event("currentMoneyChanged"));
					break;
				case ItemModel.HOURGLASS:
					model.startTime = model.currentTime + 10;
					// model.maxTime = 30;
					timerService.start();
					break;
				case ItemModel.FLASH:
					//processFlashEnergyBonus();
					var ev:DynamicEvent = new DynamicEvent("onFlashEnergyIncrease");
					ev.val =  model.matchModelProto.mbEnergy; //event.val;
					eventDispatcher.dispatchEvent( ev );
					
					break;
				default:
					log("OnBonusCommand.execute()", "Strange thing: no case for bonusType:" + event.bonusType);
			}
		}
	}
}
