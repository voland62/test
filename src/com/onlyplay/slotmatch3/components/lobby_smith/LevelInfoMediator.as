package com.onlyplay.slotmatch3.components.lobby_smith
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;

	import mx.core.FlexGlobals;

	import flash.events.Event;
	import flash.events.MouseEvent;

	public class LevelInfoMediator extends Mediator
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var view : IInterLevelDlg;

		override public function initialize() : void
		{
			addViewListener(MouseEvent.CLICK, onViewBtnClick);
			addViewListener("underConstruction", dispatch)

			/*addContextListener("state_changes", LobbyChangesState);
			addContextListener("islandsDataReady", view.onDataArrive);*/
		}

		private function onViewBtnClick(e : MouseEvent) : void
		{
			switch(e.target.name)
			{
				case "shopBtn":
					FlexGlobals.topLevelApplication.getUnderConstrWnd(e)
					break;
				case "playBtn":
					// FlexSprite(view).visible = false;
					// IInterLevelDlg(view).hide();
					view.dispatchEvent(new Event("close"));
					service.enterLocation(gameModel.currentIsland.islandId, gameModel.currentLocation.locationId);
					// var event : DynamicEvent = new DynamicEvent("state_changes_request");
					// var event : DynamicEvent = new DynamicEvent("state_changes");
					// event.state = "game";
					// dispatch(event);
					break;
				default:
			}
		}
	}
}