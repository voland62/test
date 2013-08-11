package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.components.games.Parser;
	import com.onlyplay.slotmatch3.components.games.slot.LinesData;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class OnSpinCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnSpinCommand.execute()");
			log(event.message.toString());

			// return;

			// lines
			var message : SpinResponseProtobuf = event.message as SpinResponseProtobuf;
			gameModel.icons = Parser.parseSpinData( message.icons);
//
			//var lines : Array = Parser.parseByteArray(message.winLines);
//			var linesPoints : Array = [];
//			for each (var i : int in lines)
//			{
//				linesPoints.push(LinesData.lines[i]);
//			}
//
			gameModel.winLines = message.winLines.lines;//linesPoints;
			gameModel.win = message.winMoney;
			
			
//
//			// total win
//			var winMultiplyers : Array = Parser.parseByteArray(message.winLinesMultipliers, 2);
//			var winItemsInLines : Array = Parser.parseByteArray(message.winLinesIconsAmount);
//
//			var totalWin : Number = 0;
//
//			for (var j : int = 0; j < winMultiplyers.length; j++)
//			{
//				totalWin += winMultiplyers[j] * winItemsInLines[j];
//			}
//
//			gameModel.win = totalWin;
//			trace('totalWin: ' + (totalWin));
//
//			if ( gameModel.win > 0)
//			{
//				service.dispatchLastProgressToAll( gameModel.win );
//			}
//
//			// populating model
			eventDispatcher.dispatchEvent(new Event("showSpin"));
		}
	}
}
