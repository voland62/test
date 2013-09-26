package com.onlyplay.slotmatch3.view.dialogs
{
	import flash.events.IEventDispatcher;
	/**
	 * @author Andrew
	 */
	 
	 
	public interface ITimeOverPopup extends IEventDispatcher 
	{
		function init(win : Number, multiplier : Number, time:Number, nextLevelMultiplyer : Number) : void;
		
		
		
	}
}
