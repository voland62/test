package com.onlyplay.slotmatch3.controller.match
{
	import mx.events.DynamicEvent;
	import robotlegs.bender.bundles.mvcs.Command;

	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class TimeOverCommand extends Command
	{
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			var state;
			if ( state == "match_state")
			{
				eventDispatcher.dispatchEvent(new DynamicEvent("showTimeOverDialog"));
			}
		}
	}
}
