package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import mx.core.FlexGlobals;
	
	
	public class Menu4View extends Sprite{
		
		private var menu:menu_4_sborka;
		
		public function Menu4View() {
			init();
		}
		
		private function init():void {
			
			menu = new menu_4_sborka();
			menu.scaleX = menu.scaleY = 0.7
			addChild(menu);
			
			menu.menu_4_achives.addEventListener(MouseEvent.CLICK, onClick)
			menu.menu_4_friends.addEventListener(MouseEvent.CLICK, onClick)
			menu.menu_4_g.addEventListener(MouseEvent.CLICK, onClick)
			menu.menu_4_ratings.addEventListener(MouseEvent.CLICK, onClick)
			
		}
		
		private function onClick(e:MouseEvent):void {
			FlexGlobals.topLevelApplication.getUnderConstrWnd(e);
		}
		
	}

}