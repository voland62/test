package com.onlyplay.slotmatch3.controller
{
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.netease.protobuf.Message;
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	/**
	 * @author Design3d
	 */
	public class OnLoginCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel:GameModel;
		
		override public function execute() : void
		{
			log("OnLoginCommand.execute()");
			
			var message:PlayerLoginResponseProtobuf = event.message as PlayerLoginResponseProtobuf;
			log(message.toString());
			gameModel.gameId = message.gameId;
			
			
			service.getUserData( gameModel.gameId );
			
			//service.enterLocation();
			
			service.enterRoom();
		}
	}
}
