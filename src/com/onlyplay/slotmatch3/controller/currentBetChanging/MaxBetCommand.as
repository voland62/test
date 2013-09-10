package com.onlyplay.slotmatch3.controller.currentBetChanging
{
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;

	import mx.events.DynamicEvent;

	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class MaxBetCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var event : DynamicEvent;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			gameModel.currentBet.betPerLine = gameModel.currentLocation.maxBet;//currentIsland.maxBet;
			gameModel.currentBet.lines =  gameModel.getLines( gameModel.currentLocation.maxLinesAmount);//currentIsland.maxLines;
			
			eventDispatcher.dispatchEvent(new DynamicEvent("currenBetUpdated"));
			eventDispatcher.dispatchEvent(new Event("spin"));
		}
	}
}
