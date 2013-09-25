package com.onlyplay.slotmatch3.components.lobby_smith{

	import flash.events.*;
	import flash.text.*;
	import flash.display.*;
	import mx.core.FlexGlobals;

	public class Menu4View extends Sprite {
		
		private var menu4:menu_4_sborka;
		
		public function Menu4View() {
			init()
		}
		
		
		
		private function init():void {
			menu4 = new menu_4_sborka();
			menu4.scaleX = menu4.scaleY = 0.7;
			addChild(menu4)
			
			menu4.menu_4_achives.addEventListener(MouseEvent.CLICK, onClick);
			menu4.menu_4_friends.addEventListener(MouseEvent.CLICK, onClick);
			menu4.menu_4_g.addEventListener(MouseEvent.CLICK, onClick);
			menu4.menu_4_ratings.addEventListener(MouseEvent.CLICK, onClick);
			
		}
		
		private function onClick(e:MouseEvent):void {
			FlexGlobals.topLevelApplication.getUnderConstrWnd(e)
		}

	}

}