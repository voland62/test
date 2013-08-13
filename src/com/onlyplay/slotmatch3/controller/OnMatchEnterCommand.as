package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.MatchTimerService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnMatchEnterCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var model : MatchGameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var timerService : MatchTimerService;
		
		

		override public function execute() : void
		{
			log("OnMatchEnterCommand.execute()");
			var m : MatchEnterResponseProtobuf = event.message as MatchEnterResponseProtobuf;
			log(m);

			model.startTime = 35;

			
			var matchModel :MatchProtobuf = m.match; 

			model.matchModelProto = matchModel;
			//model.maxTime =  matchModel.time;
			model.startTime = matchModel.time;
			log('model.startTime: ' + (model.startTime));
			
			//model.currentTime = ;
			timerService.start();
			eventDispatcher.dispatchEvent(new Event( "showMatch" ));
		}
	}
}
