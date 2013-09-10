package com.onlyplay.slotmatch3.view
{
	import com.onlyplay.slotmatch3.model.BoosterVO;
	import com.onlyplay.slotmatch3.components.games.elements.booster.BoosterPanel;
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.MatchGameModel;

	import mx.events.DynamicEvent;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class BoosterPanelMediator extends Mediator
	{
		[Inject]
		public var view : BoosterPanel;
		[Inject]
		public var matchGameModel : MatchGameModel;

		override public function initialize() : void
		{
			addViewListener("onBoosterClick", onBoosterClick);
			addContextListener("boosterAmountChanged", onBoosterAmountUpdate);
			addContextListener("showMatch", showMatch);
			addContextListener("boosterTimerTick", onBoosterTick);
			
			view.initBoosters( matchGameModel.boosters );
		}

		private function onBoosterAmountUpdate(e:DynamicEvent) : void
		{
			var b:BoosterVO = matchGameModel.boosters[ e.boosterType ];
			view.setBoosterAmount( b.boosterId, b.amount );
		}

		private function onBoosterTick(e:Event) : void
		{
			view.setBoostersEnergy( matchGameModel.currentBoostersCharge );
		}

		private function showMatch(e : Event = null) : void
		{
			//log("--------BoosterPanelMediator.showMatch(e)");
			view.initBoosters( matchGameModel.boosters );
		}

		private function onBoosterClick(e : DynamicEvent) : void
		{
			//log("BoosterPanelMediator.onBoosterClick(e)", e.boosterType);
				dispatch(e);
//			if ( (matchGameModel.boosters[e.boosterType] as BoosterVO).availible )
//			{			
//			}
		}
	}
}
