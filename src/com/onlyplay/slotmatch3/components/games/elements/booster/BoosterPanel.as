package com.onlyplay.slotmatch3.components.games.elements.booster
{
	import mx.events.DynamicEvent;
	import flash.events.MouseEvent;
	import alternativa.gui.alternativagui;
	import alternativa.gui.base.GUIobject;

	import flash.display.DisplayObject;

	/**
	 * @author Andrew
	 */
	public class BoosterPanel extends GUIobject
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/bg_4.png", mimeType="image/png")]
		protected static var BgClass : Class;
		private var _timeBooster : Booster;
		private var _cubeBooster : Booster;
		private var _hammerBooster : Booster;
		private var _bombBooster : Booster;

		public function BoosterPanel()
		{
			var _bg : DisplayObject = new BgClass();
			addChild(_bg);

			alternativagui::_width = _bg.width;
			alternativagui::_height = _bg.height;
			
			_bombBooster = new Booster();
			_bombBooster.skin = [Booster.BombaAClass, Booster.BombaNClass];
			_bombBooster.label = "Мега-бомба";
			_bombBooster.num = 25;
			_bombBooster.persent = 0.5;
			
			_bombBooster.x = 13;
			_bombBooster.y = 10;
			addChild(_bombBooster);
			
			_cubeBooster = new Booster();
			_cubeBooster.skin = [Booster.KubAClass, Booster.KubNClass];
			_cubeBooster.label = "Замедление";
			_cubeBooster.num = 25;
			_cubeBooster.persent = 0.5;
			
			_cubeBooster.x = 13;
			_cubeBooster.y = 95;
			addChild(_cubeBooster);
			
			_hammerBooster = new Booster();
			_hammerBooster.skin = [Booster.HammerAClass, Booster.HammerNClass];
			_hammerBooster.label = "Молоток";
			_hammerBooster.num = 25;
			_hammerBooster.persent = 0.5;
			
			_hammerBooster.x = 13;
			_hammerBooster.y = 183;
			addChild(_hammerBooster);
			
			_timeBooster = new Booster();
			_timeBooster.skin = [Booster.HourGlassAClass, Booster.HourGlassNClass];
			_timeBooster.label = "Время";
			_timeBooster.num = 25;
			_timeBooster.persent = 0.5;
			
			_timeBooster.x = 13;
			_timeBooster.y = 270;
			addChild(_timeBooster);
			
			addEventListener(MouseEvent.CLICK, onClick);
		}

		private function onClick(e : MouseEvent) : void
		{
			
			//log("BoosterPanel.onClick(e)", e.target);
			var booster :int; 
			switch(e.target){
				case _bombBooster:
					booster = Booster.BOMB;
					break;
				case _cubeBooster:
					booster = Booster.CUBE
					break;
				case _hammerBooster:
					booster = Booster.HAMMER
					break;
				case _timeBooster:
					booster = Booster.TIME;
					break;
				default:
			}
			if (booster)
			{
				var event :DynamicEvent = new DynamicEvent("onBoosterClick");
				event.boosterType = booster;
				dispatchEvent(event);
			}
		}
	}
}
