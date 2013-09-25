package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.events.Event;
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
			addViewListener("lobby_view:lobby_exit", onLobbyExit);
			
			addContextListener("state_changes", LobbyChangesState);
			addContextListener("islandsDataReady", view.onDataArrive)
		}
		
		
		
		
		
		private function onLobbyExit(e:Event):void {
			var event : DynamicEvent = new DynamicEvent("state_changes_request");
			event.state = "game";
			dispatch(event);
		}
		
		
		
		private function LobbyChangesState(e:DynamicEvent):void {
			
			var vis:Boolean = e.state == "lobby"
			
			view.visible = vis;
			// юсер дата и топ должны убираться своими медиаторами, но пока так
			for (var i:uint = 0; i < FlexGlobals.topLevelApplication.numElements; i++) {
				var id:String = FlexGlobals.topLevelApplication.getElementAt(i)["id"];
				if (id && id.indexOf("lobby") != -1) {
					 FlexGlobals.topLevelApplication.getElementAt(i).visible = vis;
				}
			}
			
 		}
		
	}

}