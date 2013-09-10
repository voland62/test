package com.onlyplay.slotmatch3.controller
{
	import flash.geom.Point;
	import com.onlyplay.slotmatch3.components.games.slot.LinesData;
	import com.onlyplay.slotmatch3.components.games.slot.LineVO;
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.components.games.Parser;
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
			var newState:Array = Parser.parseSpinData( message.icons);
			trace('message.icons: ' + (message.icons));
			gameModel.icons = newState;
			//trace('gameModel.icons: ' + (gameModel.icons));
//
			//var lines : Array = Parser.parseByteArray(message.winLines);
//			var linesPoints : Array = [];
//			for each (var i : int in lines)
//			{
//				linesPoints.push(LinesData.lines[i]);
//			}
//
			gameModel.winLines = convertProtoLinesToVoLines(message.winLines.lines,gameModel.icons);//message.winLines.lines;
			//line1.winIconsTypes = LineVO.calcWinTypes(line1.points, nnn);
			gameModel.win = message.winMoney;
			
			if ( gameModel.winLines && gameModel.winLines.length > 0 )
			{
				if (! (gameModel.winLines[0] as LineVO).points)
				{
					log( gameModel.winLines  );
					
				}
			}
			
			if (message.winMoney)
			{
				// здесь мы стартуем анимацию вылета выйгрыша
				//eventDispatcher.dispatchEvent(new DynamicEvent(""));
			}
			
			//message.winLines
			//gameModel
			
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
		
		// TODO: вынести либо в GameModel либо в SlotModel дибо в утиль
		private function convertProtoLinesToVoLines( protoLines:Array, icons:Array ):Array
		{
			
			var lines:Array = [];
			for each (var protoLine : WinLineProtobuf in protoLines) {
				lines.push( pritoLineToVoLine( protoLine, icons) );
			}
			return lines;
		}

		private function pritoLineToVoLine(protoLine : WinLineProtobuf, icons:Array) : LineVO
		{
			var lineVO:LineVO = new LineVO();
			lineVO.lineId = protoLine.lineNumber;
			lineVO.multiplyer = protoLine.multiplier;
			lineVO.color = LinesData.getColorById(protoLine.lineNumber);
			lineVO.points = LinesData.getLinePointsById(protoLine.lineNumber);
			lineVO.iconsCount = protoLine.iconsCount;
			lineVO.winIconsTypes = LineVO.calcWinTypes( lineVO.points, icons);
			return lineVO;
		}


	}
}
