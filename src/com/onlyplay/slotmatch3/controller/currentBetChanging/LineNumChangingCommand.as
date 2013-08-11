package com.onlyplay.slotmatch3.controller.currentBetChanging
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.components.games.Util;
	import com.onlyplay.slotmatch3.model.GameModel;

	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class LineNumChangingCommand extends Command
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

			var maxVal : Number = gameModel.currentLocation.maxLinesAmount;//currentIsland.maxLines;
			var minVal : Number = gameModel.currentLocation.minLinesAmount;//currentIsland.minLines;
			var interval:Number = maxVal - minVal + 1;
			var val :Number = gameModel.currentBet.linesNum + delta;

			gameModel.currentBet.linesNum = Util.mod_( val - minVal, interval) + minVal;

			eventDispatcher.dispatchEvent(new Event("currenBetUpdated"));
		}
	}
}
