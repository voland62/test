package com.onlyplay.slotmatch3.view.dialogs
{
	import flash.events.IEventDispatcher;
	/**
	 * @author Andrew
	 */
	public interface IToSlot extends IEventDispatcher
	{
		function setWin(win : int, currentMoney : int) : void;
		
	}
}
