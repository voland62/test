package com.onlyplay.slotmatch3.view
{
	import mx.events.DynamicEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;

	/**
	 * @author Andrew
	 */
	public class BoosterPanelMediator extends Mediator
	{


		override public function initialize() : void
		{
			addViewListener("onBoosterClick", onBoosterClick);
			
		}

		private function onBoosterClick(e:DynamicEvent) : void
		{
			//log("BoosterPanelMediator.onBoosterClick(e)", e.boosterType);
		}
	}
}
