package com.onlyplay.slotmatch3.controller.match
{
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;

	/**
	 * @author Andrew
	 */
	public class PlaySlotCommand extends Command
	{
		
		[Inject]
		public var gameModel : GameModel;
		
		[Inject]
		public var matchGame: MatchGameModel;
		
		[Inject]
		public var service : ISlotService;
		
		override public function execute() : void
		{
			var levelIndex : int = matchGame.matchModelProto.levels.indexOf(matchGame.currentLevel);
			var coinsAmount:int = matchGame.currentCoinsAmount;
			
			
			
			service.leaveMatch( levelIndex, coinsAmount );
		}
	}
}
