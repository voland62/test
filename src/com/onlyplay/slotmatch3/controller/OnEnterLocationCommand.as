package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnEnterLocationCommand extends Command
	{
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnEnterLocationCommand.enclosing_method(enclosing_method_arguments)");
			gameModel._ready = true;
			var message:LocationEnterResponseProtobuf = event.message as LocationEnterResponseProtobuf;
			gameModel.targetProgress =  message.room.progress;
			// message.room.
			eventDispatcher.dispatchEvent(new Event("ready"));
		}
	}
}
