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
	public class OnChageCommand extends Command
	{
//		[Inject]
//		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnChageCommand.execute()");
			var message:DataChangesProtobuf = event.message as DataChangesProtobuf;
			log(message);
			
			if (message.locationChanged)
			{
				//message.location.star1quest
				//for
				gameModel.currentLocation = message.location;
				eventDispatcher.dispatchEvent( new Event( "locationChaged" ));
			}
			
		}
	}
}
