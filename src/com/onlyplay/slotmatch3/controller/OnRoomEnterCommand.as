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
	public class OnRoomEnterCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var event : ServiceEvent;

		override public function execute() : void
		{
			log("------- OnRoomEnterCommand.execute()");
			
			var message :ServerRoomStateProtobuf = event.message as ServerRoomStateProtobuf;
			log(message.toString());
			
			gameModel._ready = true; 
			gameModel.targetProgress = message.money;
			
			gameModel.players = message.players;
			
			//eventDispatcher.dispatchEvent(new Event(""));
			eventDispatcher.dispatchEvent(new Event("ready"));
		}
	}
}
