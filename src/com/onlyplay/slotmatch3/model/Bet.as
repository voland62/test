package com.onlyplay.slotmatch3.model
{
	/**
	 * @author Design3d
	 */
	public class Bet
	{
		//public var linesNum:uint = 0;
		public var lines:Array = [];
		public var betPerLine:Number = 0;
		
		public function getWholeBet():Number
		{
			return lines.length * betPerLine;
		}
	}
}
