package com.onlyplay.slotmatch3.controller.spin
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.components.games.Parser;
	import com.onlyplay.slotmatch3.components.games.slot.LineVO;
	import com.onlyplay.slotmatch3.components.games.slot.LinesData;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class OnSpinCommand extends Command
	{
//		[Inject]
//		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnSpinCommand.execute()");
			//log(event.message.toString());
			
			
			
			
			// lines
			var message : SpinResponseProtobuf = event.message as SpinResponseProtobuf;
			var newState:Array = Parser.parseSpinData( message.icons );
			//trace('message.icons: ' + (message.icons));
			gameModel.icons = newState;
			
			//return;
			
			gameModel.winLines = convertProtoLinesToVoLines(message.winLines.lines,gameModel.icons);
			
			gameModel.win = message.winMoney;
			
			if ( gameModel.winLines && gameModel.winLines.length > 0 )
			{
				if (! (gameModel.winLines[0] as LineVO).points)
				{
					log( gameModel.winLines  );
				}
			}
			
			//eventDispatcher.dispatchEvent(new Event("showSpin"));
			gameModel.spinReadyFlag = true;
			eventDispatcher.dispatchEvent(new Event("tryStopSpin"));
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
			lineVO.winIconsTypes = LineVO.calcWinTypes( lineVO.points, icons );
			return lineVO;
		}


	}
}
