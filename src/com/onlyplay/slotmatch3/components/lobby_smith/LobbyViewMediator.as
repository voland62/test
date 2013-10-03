package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.events.*;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyView;
	import mx.events.DynamicEvent;
	import mx.core.FlexGlobals;
	
	public class LobbyViewMediator extends Mediator {
		
		[Inject]
		public var view : LobbyView;
		[Inject]
		public var gameModel : GameModel;
		
		
		override public function initialize() : void{
			
			addViewListener("openInterLevelDlg", OpenInterLevelDlg);
			addViewListener("lobby:first_map_ready", dispatch);
			addViewListener("underConstruction", dispatch)
			
			addContextListener("islandsDataChanges", view.onDataArrive)
			
			//addContextListener("state_changes", LobbyChangesState);
			if ( gameModel.islands )
			{
				var event:DynamicEvent = new DynamicEvent("");
				event.data = gameModel.islands;
				view.onDataArrive(event);
			}else
			{
				addContextListener("islandsDataReady", view.onDataArrive);
			}
		}
		
		
		private function OpenInterLevelDlg(e:DynamicEvent):void {
			
			var event :DynamicEvent = new DynamicEvent("showInterLevelPupup");
			event._locType = e._locType;
			event._island = e._island;
			event._location = e._location;
			dispatch(event);
	
		}
		
		
		
		
		private function LobbyChangesState(e:DynamicEvent):void {
			
			dispatch(e);
			//var vis:Boolean = e.state == "lobby";
			
			//view.visible = vis;
			// юсер дата и топ должны убираться своими медиаторами, но пока так
			
//			for (var i:uint = 0; i < FlexGlobals.topLevelApplication.numElements; i++) {
//				var id:String = FlexGlobals.topLevelApplication.getElementAt(i)["id"];
//				if (id && id.indexOf("lobby") != -1) {
//					 FlexGlobals.topLevelApplication.getElementAt(i).visible = vis;
//				}
//			}
			
 		}
		
	}

}