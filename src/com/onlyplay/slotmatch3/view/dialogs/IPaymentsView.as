package com.onlyplay.slotmatch3.view.dialogs
{
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public interface IPaymentsView extends IEventDispatcher
	{
		function setList( multiplayersList:Array ):void
	}
}
