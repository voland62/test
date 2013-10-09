package com.onlyplay.slotmatch3.controller.spin
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class SpinCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			// TODO: взять из модели

			if (gameModel._ready)
			{
				log("SpinCommand.execute() make spin");
				var newExperince : int = gameModel.currentExperience.experience + gameModel.win;
				gameModel.currentExperience = gameModel.getExperienceStuff(newExperince);
				eventDispatcher.dispatchEvent(new Event("currentExperienceChanged"));

				gameModel.currentMoney += gameModel.win - gameModel.currentBet.getWholeBet(); 
				//log('gameModel.currentMoney: ' + (gameModel.currentMoney));
				gameModel.win = 0;
				eventDispatcher.dispatchEvent(new Event("currentMoneyChanged"));
				
				gameModel.spinReadyFlag = false;
				gameModel.spinTimerCompleteFlag = false;
				
				service.spin(gameModel.currentBet.lines.length, gameModel.currentBet.betPerLine);
			}
		}
	}
}
