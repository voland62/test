package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnEnterLocationCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnEnterLocationCommand.enclosing_method(enclosing_method_arguments)");
			gameModel._ready = true;
			eventDispatcher.dispatchEvent(new Event("ready"));
		}
	}
}
