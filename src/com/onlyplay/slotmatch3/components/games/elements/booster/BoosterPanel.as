package com.onlyplay.slotmatch3.components.games.elements.booster
{
	import com.onlyplay.slotmatch3.model.BoosterVO;
	import flash.utils.Dictionary;
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
		
		private var _boosters:Array;

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
			_bombBooster.maxVal = 150;//75;
			
			_bombBooster.x = 13;
			_bombBooster.y = 10;
			addChild(_bombBooster);
			
			_cubeBooster = new Booster();
			_cubeBooster.skin = [Booster.KubAClass, Booster.KubNClass];
			_cubeBooster.label = "Перемешать";
			_cubeBooster.num = 25;
			_cubeBooster.persent = 0.5;
			_cubeBooster.maxVal = 150;//100;
			
			_cubeBooster.x = 13;
			_cubeBooster.y = 95;
			addChild(_cubeBooster);
			
			_hammerBooster = new Booster();
			_hammerBooster.skin = [Booster.HammerAClass, Booster.HammerNClass];
			_hammerBooster.label = "Молоток";
			_hammerBooster.num = 25;
			_hammerBooster.persent = 0.5;
			_hammerBooster.maxVal = 150;//125;
			
			_hammerBooster.x = 13;
			_hammerBooster.y = 183;
			addChild(_hammerBooster);
			
			_timeBooster = new Booster();
			_timeBooster.skin = [Booster.HourGlassAClass, Booster.HourGlassNClass];
			_timeBooster.label = "Время";
			_timeBooster.num = 25;
			_timeBooster.persent = 0.5;
			_timeBooster.maxVal = 150;
			
			_timeBooster.x = 13;
			_timeBooster.y = 270;
			addChild(_timeBooster);
			
			_boosters = [ null, _bombBooster, _cubeBooster, _hammerBooster, _timeBooster ];
			
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
					booster = Booster.CUBE;
					break;
				case _hammerBooster:
					booster = Booster.HAMMER;
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

		public function initBoosters( boosters:Dictionary ) : void
		{
			for each (var boosterProto : BoosterVO in boosters) {
				var b:Booster = _boosters[boosterProto.boosterId];
				b.maxVal = boosterProto.maxEnergy;
				b.num = boosterProto.amount;
				b.persent = 1;
			}
		}

		public function setBoostersEnergy(currentEnergy : Number) : void
		{
			for each (var b: Booster in _boosters) 
			{
				if (b)
				{
			
					var pers:Number = currentEnergy / b.maxVal;
					//trace('pers: ' + (pers));
					b.persent = pers;	
				}
			}
		}

		public function setBoosterAmount(boosterId : int, amount : int) : void
		{
			(_boosters[boosterId] as Booster).num = amount;
		}
		
		
	}
}
