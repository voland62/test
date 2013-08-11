package com.onlyplay.slotmatch3.model
{
	/**
	 * @author Design3d
	 */
	public class Bet
	{
		public var linesNum:uint = 0;
		public var betPerLine:Number = 0;
		
		public function getWholeBet():Number
		{
			return linesNum * betPerLine;
		}
	}
}
