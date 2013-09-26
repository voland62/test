package com.onlyplay.slotmatch3.controller
{
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.Command;

	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnMatchLeaveComand extends Command
	{
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			// log("--- OnMatchLeaveComand.execute()");
			
			eventDispatcher.dispatchEvent( new Event( "showSlot" ));
		}
	}
}
