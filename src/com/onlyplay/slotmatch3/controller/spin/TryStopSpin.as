package com.onlyplay.slotmatch3.controller.spin
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class TryStopSpin extends Command
	{
		
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var slotMatchModel:MatchGameModel;
		
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		
		override public function execute() : void
		{
			log("TryStopSpin.execute()");
			//var ready:Boolean = true;
			if ( gameModel.spinReadyFlag && gameModel.spinTimerCompleteFlag )
			{
				eventDispatcher.dispatchEvent(new Event("showSpin"));
				gameModel.spinReadyFlag = false;
				gameModel.spinTimerCompleteFlag = false;
			}
		}
	}
}
