package com.onlyplay.slotmatch3.view
{
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public interface IApp extends IEventDispatcher
	{
		function setGameState(state : String) : void;
	}
}
