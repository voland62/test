package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.display.*;
	import com.smith.gallery.SmtHrzGallery;
	import com.smith.gallery.engine.GalleryEvent;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyCellItem;
	

	public class LobbyView extends Sprite {
		
		private var bg:lobby_sborka_cls;
		private var fakeServerData:Vector.<Object>;
		private var gallery:SmtHrzGallery;
		private var posInd:Sprite;
		
		public function LobbyView() {
			init ();
		}
		
		private function init():void {
			BuildBg();
			BuildPositIndicator();
			GetLocationData();
			
		}
		
		private function BuildBg():void {
			bg = new lobby_sborka_cls();
			bg.x = 1;
			addChild(bg);
		}
		
		//--------------------методы индикатора "4 Точки" -------------------
		private function BuildPositIndicator():void {
			posInd = new Sprite();
			posInd.x = 240;
			posInd.y = 80;
			bg.addChild(posInd)
			
			for (var i:uint = 0; i < 4; i++) {
				var cell:positPoint = new positPoint();
				cell.name = "point_" + i;
				cell.x = i * 20;
				posInd.addChild(cell);
				
			}
			
			SetPositIndicator(0);
		}
		
		//выставляет позицию индикатора (открытый кружок)
		private function SetPositIndicator(ind:uint):void {
			for (var i:uint = 0; i < 4; i++) {
				MovieClip(posInd.getChildByName("point_" + i)).gotoAndStop(1);
			}
			MovieClip(posInd.getChildByName("point_" + ind)).gotoAndStop(2);
		}
		//--------------------------------------------------------------------
		
		private function BuildLocations(data:Vector.<Object> ):void {
			
			var cellBg:Sprite = new Sprite();
			cellBg.graphics.beginFill(0xff0000);
			cellBg.graphics.drawRect(0,0,560, 460)
			
			gallery = new SmtHrzGallery(560, 460, 1, 1, LobbyCellItem, cellBg, bg.lobby_btn_right, bg.lobby_btn_left);
			gallery.dataProvider = data;

			gallery.x = 50;
			gallery.y = 60;
			bg.addChild(gallery);
			
			//выносим кнопки листания выше галереи
			bg.addChild(bg.lobby_btn_left);
			bg.addChild(bg.lobby_btn_right);
			
			addEventListener(GalleryEvent.CURSOR_CHANGES, GalleryCursorChanges);
			
			GalleryCursorChanges(null);
		}
		
		
		public function GalleryCursorChanges(e:GalleryEvent = null):void {
			var ind:uint;
			e == null ? ind = 0 : ind = e.data.newCursor;
			
			SetPositIndicator(ind);
			
			bg.lobby_header_txt.text =  gallery.dataProvider[ind].sName;
			
		}
		
		
		
		//------------------типа эмулируем сервер------------------
		private function GetLocationData():void {
			
			//типа запрашиваем данные с сервака 
			onDataLoaded();
			
		}
		
		private function onDataLoaded(data:* = null):void{
			
			//типа пришли данные с сервака 
			fakeServerData = new Vector.<Object>();
			
			var moveClasses:Vector.<Class> = Vector.<Class>([hawaii_island, amazone_island, archipelago_island, pirate_island]);
			
			//------------------наполнение обьектов фейковыми данными --------------------------
			var locatNames:Vector.<String> = Vector.<String>(["Гавайский остров", "Амазонка", "Подводный архипелаг", "Пиратский остров"])
			for (var i:uint = 0; i < moveClasses.length; i++) {
				var locat:* = {};
				locat.locationMov = new moveClasses[i]();
				//locat.locationMov.scaleX = locat.locationMov.scaleY = 0.7
				locat.sName = locatNames[i];
				
				(!i) ? locat.stars = 1 : locat.stars = i;
				
				locat.locationActive = i < 3 ? true : false;
				
				fakeServerData.push(locat as Object);
			}
			//--------------------------------------------------------------------------------
			
			BuildLocations(fakeServerData);
		}
		
	}

}

class LocationData {
	import flash.display.MovieClip;
	
	public var locationMov:MovieClip;
	public var sName:String;
	public var stars:uint;
	public var locationActive:Boolean;
	
	
	public function LocationData(){}
}






