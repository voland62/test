package com.onlyplay.slotmatch3.controller.currentBetChanging
{
	import com.onlyplay.slotmatch3.components.games.Util;
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;

	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class BetPerLineChangingCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var event : DynamicEvent;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			var delta : Number = event.delta;

			var maxVal : Number = gameModel.currentLocation.maxBet;//gameModel.currentIsland.maxBet;
			var minVal : Number = gameModel.currentLocation.minBet;//gameModel.currentIsland.minBet;
			var interval:Number = maxVal - minVal + 1;
			var val :Number = gameModel.currentBet.betPerLine + delta;
			
			

			gameModel.currentBet.betPerLine = Util.mod_( val - minVal, interval) + minVal;
			
			eventDispatcher.dispatchEvent(new Event("currenBetUpdated"));
		}
	}
}
