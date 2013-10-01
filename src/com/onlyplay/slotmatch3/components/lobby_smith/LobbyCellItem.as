package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import com.smith.gallery.engine.ISmtGalleryItem;
	import flash.display.*;
	import flash.utils.*;
	import LocationProtobuf;
	import mx.events.DynamicEvent;
	import flash.events.MouseEvent
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
			pic.x = Math.ceil((bgLayer.width - pic.width) / 2 + 240 + correctObj["dX"]);
			pic.y = Math.ceil((bgLayer.height - pic.height) / 2 + 220 + correctObj["dY"]);
			
			contentLayer.addChild(pic);
		}
		
		
		
		//устанавливаем состояние мувика карты
		private function SetMovieState():void {
			
			var pic:MovieClip = _data.locationMov
			
			if (_data.info.opened){
				// анимированный мувик - остров открыт
				pic.gotoAndStop(1);
				for (var i:uint = 0; i < pic.numChildren; i++ ) {
					dObj = pic.getChildAt(i);
					if (dObj is MovieClip) MovieClip(dObj).play();
				}
			}else {
				// эскиз - остров закрыт
				for (i = 0; i < pic.numChildren; i++ ) {
					var dObj:DisplayObject = pic.getChildAt(i);
					if (dObj is MovieClip) MovieClip(dObj).stop();
					
				}
				pic.gotoAndStop(2);
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
					
					//определяем индекс кнопки исходя из её номера
					var ind:uint = uint(btn.name.substr(4))
					var locInfo:LocationProtobuf = _data.info.locations[ind];
					
					//определяем цвет из открытости и острова
					var sColor:String
					if  (locInfo.opened){
						sColor = mapColors[getQualifiedClassName(_data.locationMov)];
					}else {
						sColor = "grey";
					}
					
					//определяем число открытых звёздочек 
					var strs:uint = 0;
					for (var j:uint = 1; j <= 3; j++) {
						strs += Number(locInfo["star" + String(j) + "quest"].complete);
					}
					
					//устанавливаем вид кнопки
					SetOneBtnState(btn, sColor, strs, String(ind+1))
					
					if (!btn.hasEventListener(MouseEvent.CLICK)) SetListener(btn);
					
				}
			}
		}
		
		
		private function SetListener(btn:LocationBtnMock):void {
			btn.addEventListener(MouseEvent.CLICK, function():void{
													var evt:DynamicEvent = new DynamicEvent("openInterLevelDlg", true);
													evt._type = "locationInfo";
													evt._island = LobbyView.lastCursor;
													evt._location = uint(btn.name.substr(4));
													dispatchEvent(evt); }
													)
		}
		
		
		private function SetOneBtnState(btn:LocationBtnMock, color:String, starsNum:uint, txt:String):void {
			if (!btn) return;
			
			//цвет кнопки
			if (["red", "blue", "green", "yellow"].indexOf(color) == -1) {
				//если это не один из разрешённых - нах
				
			}else {
				//если у этой кнопы цвет уже меняли - нах
				if (btn.loc_btn is btn_deaktiv){
				
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