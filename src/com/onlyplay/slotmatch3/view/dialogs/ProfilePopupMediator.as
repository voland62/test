package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;

	/**
	 * @author Andrew
	 */
	public class ProfilePopupMediator extends Mediator
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var view : IProfilePopup;
		
		
		override public function initialize() : void
		{
			view.setName (gameModel.userInfo.name );
			view.setMoney ( gameModel.userInfo.money);
			view.setLevel( gameModel.userInfo.level );
			view.setExperience ( gameModel.userInfo.experience, gameModel.userInfo.experienceBound);
			
			view.setStatistics (   
									gameModel.userInfo.statistic.maxWin,
									gameModel.userInfo.statistic.boostersUsed,
									gameModel.userInfo.statistic.friendsAmount,
									gameModel.userInfo.statistic.giftsReceived,
									gameModel.userInfo.statistic.giftsSended
								 );  
		}

	}
}
