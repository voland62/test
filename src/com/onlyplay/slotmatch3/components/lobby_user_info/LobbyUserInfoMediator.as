package com.onlyplay.slotmatch3.components.lobby_user_info {
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	import com.onlyplay.slotmatch3.components.lobby_user_info.LobbyUserInfoView;
	import com.onlyplay.slotmatch3.model.GameModel;
	import flash.display.MovieClip;
	//import PlayerProtobuf;
	import flash.events.MouseEvent;
	import mx.events.DynamicEvent
	
	public class LobbyUserInfoMediator extends Mediator {
		
		public function LobbyUserInfoMediator() {
			
		}
		
		[Inject]
		public var gameModel : GameModel;
		
		[Inject]
		public var view : LobbyUserInfoView;
		
		
		override public function initialize() : void{
			addContextListener("userDataUpdated", UpdateData);
			addViewListener(MouseEvent.CLICK, onMouseClick)
		}
		
		private function onMouseClick(e:MouseEvent):void {
			if (e.target.name.indexOf("btn_") != -1) {
				dispatch(new DynamicEvent("underConstruction"));
			}
		}
		
		
		private function UpdateData(data:*):void {
			view.show(gameModel.userInfo);
		}
		
		
		
		
		
	}

}