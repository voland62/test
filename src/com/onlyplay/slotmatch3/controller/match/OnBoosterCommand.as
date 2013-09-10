package com.onlyplay.slotmatch3.controller.match
{
	import com.onlyplay.slotmatch3.services.MatchTimerService;
	import com.onlyplay.slotmatch3.components.games.elements.booster.Booster;
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.BoosterVO;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.BoosterTimerService;

	import mx.events.DynamicEvent;

	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnBoosterCommand extends Command
	{
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var matchModel : MatchGameModel;
		[Inject]
		public var boosterTimerService : BoosterTimerService;
		[Inject]
		public var matchTimerService : MatchTimerService;
		[Inject]
		public var e : DynamicEvent;

		override public function execute() : void
		{
			// log("OnBoosterCommand.execute()"); 
			var booster : BoosterVO = matchModel.boosters[e.boosterType];
			
			if ( booster.availible )
			{
				boosterTimerService.start();
				booster.amount--;
				for each (var b : BoosterVO in matchModel.boosters)
				{
					b.availible = false;
				}
				
				if ( e.boosterType == Booster.TIME)
				{
					matchModel.startTime = matchModel.currentTime + matchModel.matchModelProto.time;
					matchTimerService.start();
				}
				
				var event:DynamicEvent = new DynamicEvent("boosterAmountChanged");
				event.boosterType = e.boosterType;
				eventDispatcher.dispatchEvent( event );
				
			}
			
		}
	}
}
