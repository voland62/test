package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import com.smith.gallery.engine.ISmtGalleryItem;
	import flash.display.*;
	import flash.utils.*;
	/**
	 * ...
	 * @author smt
	 */
	public class LobbyCellItem extends Sprite implements ISmtGalleryItem {
		
		
		private var bgLayer:Sprite;
		private var contentLayer:Sprite;
		private var _data:Object;
		private var colorDict:Dictionary;
		private var mapColors:Dictionary;
		private var correctDict:Dictionary;
		
		public function LobbyCellItem() {
			mapColors = new Dictionary();
			mapColors["hawaii_island"] = "blue";
			mapColors["amazone_island"] = "green";
			mapColors["archipelago_island"] = "red";
			mapColors["pirate_island"] = "yellow"
			
			colorDict = new Dictionary();
			colorDict["red"] = btn_red;
			colorDict["blue"] = btn_blue;
			colorDict["green"] = btn_green;
			colorDict["yellow"] = btn_yell;
			
			//корректировка размеров и расположения мувиков карт
			correctDict = new Dictionary();
			correctDict["hawaii_island"] = 		{scale:0.75, dX:0,  dY:30}//75
			correctDict["amazone_island"] = 	{scale:0.75,  dX:0,  dY:30}//7
			correctDict["archipelago_island"] = {scale:0.75, dX:10, dY:20}//85
			correctDict["pirate_island"] = 		{scale:0.75,  dX:0,  dY:0}//8
			
			bgLayer = new Sprite();
			addChildAt(bgLayer,0);
			
			contentLayer = new Sprite();
			addChildAt(contentLayer,1);
		}
		
		
		//############### property   bgrnd ######################
		public function set bgrnd(dObj:DisplayObject):void {
			while (bgLayer.numChildren > 0) {
				bgLayer.removeChildAt(0);
			}
			bgLayer.addChild(dObj);
		}
		
		
		//############### property   data ######################
		public function get data():Object {return _data};
		public function set data(value:Object):void {
			_data = value;
			Parse();
		};
		
		//начинаем использовать данные
		private function Parse():void {
			clear();
			
			if (!contentLayer.numChildren)PlaceMap();
			
			SetMovieState();
		}
		
		
		private function PlaceMap():void {
			//индивидуальные корректировки каждого острова
			var pic:MovieClip = _data.locationMov;
			var mapName:String = getQualifiedClassName(_data.locationMov);
			var correctObj:Object = correctDict[mapName];
			
			pic.scaleX = pic.scaleY =correctObj["scale"];
			pic.x = (bgLayer.width - pic.width) / 2 + 240 + correctObj["dX"];
			pic.y = (bgLayer.height - pic.height) / 2 + 220 + correctObj["dY"];
			
			contentLayer.addChild(pic);
		}
		
		
		
		//устанавливаем состояние мувика карты
		private function SetMovieState():void {
			
			var pic:MovieClip = _data.locationMov
			
			if (!_data.locationActive){
				// эскиз
				for (var i:uint = 0; i < pic.numChildren; i++ ) {
					var dObj:DisplayObject = pic.getChildAt(i);
					if (dObj is MovieClip) MovieClip(dObj).stop();
					
				}
				pic.gotoAndStop(2);
				
			}else {
				// анимированный мувик
				pic.gotoAndStop(1);
				for (var i:uint = 0; i < pic.numChildren; i++ ) {
					dObj = pic.getChildAt(i);
					if (dObj is MovieClip) MovieClip(dObj).play();
				}
			}
			
			// определяем состояние кнопок
			SetLocationBtnState();
		}
		
		
		private function SetLocationBtnState():void {
			var pic:MovieClip = _data.locationMov
			
			for (var i:uint = 0; i < pic.numChildren; i++ ) {
				//ищем собственно кнопки
				if (pic.getChildAt(i) is LocationBtnMock) {
					
					var btn:LocationBtnMock = pic.getChildAt(i) as LocationBtnMock;
					btn.numTxt.mouseEnabled = btn.starsBar.mouseEnabled = false;
					
					var sText:String = btn.name.substr(4)
					var sColor:String = mapColors[getQualifiedClassName(_data.locationMov)];
					var strs:uint = _data.stars;
					
					SetOneBtnState(btn, sColor, strs, sText)
					
				}
			}
		}
		
		
		private function SetOneBtnState(btn:LocationBtnMock, color:String, starsNum:uint, txt:String):void {
			if (!btn) return;
			
			//цвет кнопки
			if (["red", "blue", "green", "yellow"].indexOf(color) == -1) {
				//если это не один из разрешённых - нах
				return;
			}else {
				//если у этой кнопы цвет уже меняли - нах
				if (!(btn.loc_btn is btn_deaktiv)) return;
				
				
				btn.removeChildAt(0);
				var newBtn:SimpleButton
				
				switch (color) {
					case "red":
								newBtn = new btn_red();
								break;
					case "blue":
								newBtn = new btn_blue();
								break;
					case "green":
								newBtn = new btn_green();
								break;
					case "yellow":
								newBtn = new btn_yell();
								break;
					default:
								
				}
				
				btn.addChildAt(newBtn, 0);
			}
			
			
			//количество звёзд
			if (starsNum >= 0 && starsNum <= 3) btn.starsBar.gotoAndStop(starsNum + 1);
			//текст на кнопке
			if (txt != "") btn.numTxt.text = txt;
			
		}
		
	
		public function clear():void {
			while (contentLayer.numChildren > 0) {
				
				contentLayer.removeChildAt(0);
			}
		}
	}

}