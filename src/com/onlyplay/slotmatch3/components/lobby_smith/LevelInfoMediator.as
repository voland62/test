package com.onlyplay.slotmatch3.components.lobby_smith
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;

	import mx.events.DynamicEvent;

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
		[Inject]
		public var event:DynamicEvent;

		override public function initialize() : void
		{
			addViewListener(MouseEvent.CLICK, onViewBtnClick);
			addViewListener("underConstruction", dispatch)
			
			view.show( event , gameModel.islands.islands);

			/*addContextListener("state_changes", LobbyChangesState);
			addContextListener("islandsDataReady", view.onDataArrive);*/
		}

		private function onViewBtnClick(e : MouseEvent) : void
		{
			log("LevelInfoMediator.onViewBtnClick(e)");
//			event._locType = e._type;
//			event._island = e._island;
//			event._location = e._location;
			
			switch(e.target.name)
			{
				case "shopBtn":
					//FlexGlobals.topLevelApplication.getUnderConstrWnd(e)
					dispatch(new DynamicEvent("underConstruction"));
					break;
				case "playBtn":
//					log( "event._locType:" + event._locType);
//					log ( "event._island:" + event._island );
//					log ( "event._location:" + event._location );
					
					if ( event._locType == "locationInfo" )
					{
						var islandId:int = (gameModel.islands.islands[event._island] as IslandProtobuf).islandId;
						//trace('islandId: ' + (islandId));
						var locationId:int = ((gameModel.islands.islands[event._island] as IslandProtobuf).locations[event._location] as LocationProtobuf).locationId;
						//trace('locationId: ' + (locationId));
						view.dispatchEvent(new Event("close"));
						service.enterLocation( islandId, locationId);
						
					}
					else if ( event._locType == "islandInfo" )
					{
						// Здесь мы вообще-то не должны быть так как это случай другого попапа не локэйшен инфо а айланд инфо
						view.dispatchEvent(new Event("close"));
						service.enterLocation( 1, 1);
						
					}
					
					break;
				default:
			}
		}
	}
}