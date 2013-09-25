package com.onlyplay.slotmatch3.controller.lobby {
	
	import robotlegs.bender.bundles.mvcs.Command;
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import mx.events.DynamicEvent;
	
	public class StateChangesCommand extends Command {
		
		[Inject]
		public var disp:IEventDispatcher;
		
		[Inject]
		public var inEvent:DynamicEvent;
		
		override public function execute() : void
		{
			var evt:DynamicEvent = new DynamicEvent("state_changes");
			evt.state = inEvent.state
			disp.dispatchEvent(evt)
		}
		
	}

}