package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnRoomChangeedCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnRoomChangeedCommand.execute()");
			var message:RoomChangedEventProtobuf = event.message as RoomChangedEventProtobuf;
			gameModel.lastProgress = message.players.me.progress;
			//gameModel.currentExperience.experience =  message.players.me.experience;
			//gameModel.currentExperience.level = message.players.me.level;
			//gameModel.currentExperience.leftVal = message.players.me.experience;
			//trace('message.players.me.experience: ' + (message.players.me.experience));
			//gameModel.currentExperience.rightVal = message.players.me.experienceBound;
			//trace('message.players.me.experienceBound: ' + (message.players.me.experienceBound));
			gameModel.currentMoney = message.players.me.money;
			
			gameModel.players = message.players.roommates;
			eventDispatcher.dispatchEvent(new Event("playersListUpdated"));
			eventDispatcher.dispatchEvent(new Event("onRoomProgressChanged"));
			
			
//			for each (var pl : in message.players.roommates) {
//				
//			}
		}
	}
}
