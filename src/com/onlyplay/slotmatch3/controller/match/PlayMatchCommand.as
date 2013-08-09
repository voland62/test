package com.onlyplay.slotmatch3.controller.match
{
	import com.onlyplay.slotmatch3.services.MatchTimerService;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import robotlegs.bender.bundles.mvcs.Command;

	/**
	 * @author Andrew
	 */
	public class PlayMatchCommand extends Command
	{
		// 
		[Inject]
		public var timerService:MatchTimerService;
		
		[Inject]
		public var model:MatchGameModel;
		
		override public function execute() : void
		{
			//model.maxTime = 30;
			model.startTime = 35;
			
			timerService.start();
			
		}
		
	}
}
