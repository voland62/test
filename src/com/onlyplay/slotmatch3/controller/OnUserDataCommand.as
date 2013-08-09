package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class OnUserDataCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnUserDataCommand.execute()");
			var message : PlayerDataLoadResponseProtobuf = event.message as PlayerDataLoadResponseProtobuf;
			trace('message.playerData: ' + (message.playerData));
			// message.playerData.info
			trace('message.playerData.info: ' + (message.playerData.info));

			gameModel.userInfo = message.playerData.info;
			gameModel.currentMoney = message.playerData.info.money;
			
			gameModel.currentExperience = gameModel.getExperienceStuff(message.playerData.info.experience);
			
			eventDispatcher.dispatchEvent(new Event("userDataUpdated"));
		}
	}
}
