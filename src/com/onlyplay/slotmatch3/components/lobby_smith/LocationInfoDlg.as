package com.onlyplay.slotmatch3.components.lobby_smith{

	import flash.events.*;
	import flash.text.*;
	import flash.display.*;

	public class LocationInfoDlg extends Sprite {

		public function LocationInfoDlg() {
			addEventListener(Event.ADDED_TO_STAGE, onStage)
		}
		
		private function onStage(e:Event):void {
			
			removeEventListener(Event.ADDED_TO_STAGE, onStage);
			graphics.beginFill(0x000000, 0.5);
			graphics.drawRect(0, 0, stage.stageWidth, stage.height);
			graphics.endFill();
			
		}
		
		

	}

}