package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import spark.core.SpriteVisualElement
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mx.events.DynamicEvent;
	import mx.core.FlexGlobals;
	import mx.core.FlexSprite
	
	public class LevelInfoMediator extends Mediator {
		
		[Inject]
		public var view : IInterLevelDlg;
		
		override public function initialize() : void{
			
			addViewListener(MouseEvent.CLICK, onViewBtnClick);
			addViewListener("underConstruction", dispatch)
			
			/*addContextListener("state_changes", LobbyChangesState);
			addContextListener("islandsDataReady", view.onDataArrive);*/
		}
		
		private function onViewBtnClick(e:MouseEvent):void {
			switch(e.target.name) {
					case "shopBtn":
						FlexGlobals.topLevelApplication.getUnderConstrWnd(e)
						break;
					
					case "playBtn":
						//FlexSprite(view).visible = false;
						IInterLevelDlg(view).hide();
						//var event : DynamicEvent = new DynamicEvent("state_changes_request");
						var event : DynamicEvent = new DynamicEvent("state_changes");
						event.state = "game";
						dispatch(event);
						break;
					
					default:
			}
		}
		
		
		
		
		
		
		
	}

}