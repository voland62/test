package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.display.*;
	import com.smith.gallery.SmtHrzGallery;
	import com.smith.gallery.engine.GalleryEvent;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyCellItem;
	import flash.events.MouseEvent;
	import com.onlyplay.slotmatch3.model.GameModel;
	import mx.events.DynamicEvent;
	import IslandsProtobuf;

	public class LobbyView extends Sprite {
		
		private var bg:lobby_sborka_cls;
		//private var fakeServerData:Vector.<Object>;
		private var gallery:SmtHrzGallery;
		private var posInd:Sprite;
		private var islandsData:IslandsProtobuf;
		private var lastCursor:uint = 0;
		private var locatInfoDlg:LocationInfoDlg;
		
		[Inject]
		public var gameModel : GameModel;
		
		
		public function LobbyView() {
			init ();
		}
		
		private function init():void {
			BuildBg();
			BuildPositIndicator();
		}
		
		private function BuildBg():void {
			bg = new lobby_sborka_cls();
			bg.x = 1;
			bg.red_rect.addEventListener(MouseEvent.CLICK, onCloseClick);
			bg.play_btn.addEventListener(MouseEvent.CLICK, onPlayClick);
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
			
			/*locatInfoDlg = new LocationInfoDlg();
			locatInfoDlg.x = -posInd.x;
			locatInfoDlg.y = -posInd.y;
			addChild(locatInfoDlg);*/
			
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
			
			if (gallery == null){
				var cellBg:Sprite = new Sprite();
				cellBg.graphics.beginFill(0xff0000);
				cellBg.graphics.drawRect(0,0,560, 460)
				
				gallery = new SmtHrzGallery(560, 460, 1, 1, LobbyCellItem, cellBg, bg.lobby_btn_right, bg.lobby_btn_left);
				gallery.x = 50;
				gallery.y = 60;
				
				bg.addChild(gallery);
				addEventListener(GalleryEvent.CURSOR_CHANGES, GalleryCursorChanges);
			}
			
			gallery.dataProvider = data;

			//выносим кнопки  выше галереи
			bg.addChild(bg.lobby_btn_left);
			bg.addChild(bg.lobby_btn_right);
			
			bg.addChild(bg.play_btn);
			bg.play_btn.txt.mouseEnabled = false;
			
			GalleryCursorChanges(null);
			
		}
		
		
		
		private function onCloseClick(e:MouseEvent):void {
			
			dispatchEvent(new MouseEvent("lobby_view:lobby_exit"))
		}
		
		private function onPlayClick(e:MouseEvent):void {
			
		}
		
		
		
		public function GalleryCursorChanges(e:GalleryEvent = null):void {
			
			var ind:uint;
			
			if (e == null) {
				ind = lastCursor; 
			}else {
				ind = e.data.newCursor;
				lastCursor = ind;
			}
			
			SetPositIndicator(ind);
			
			bg.lobby_header_txt.text =  gallery.dataProvider[ind].sName;
		}
		
		
		
		
		
		internal function onDataArrive(evt:DynamicEvent):void{
			
			islandsData = evt.data;
			
			//типа пришли данные с сервака 
			var realIslandsData = new Vector.<Object>();
			
			var moveClasses:Vector.<Class> = Vector.<Class>([hawaii_island, amazone_island, archipelago_island, pirate_island]);
			var locatNames:Vector.<String> = Vector.<String>(["Гавайский остров", "Амазонка", "Подводный архипелаг", "Пиратский остров"])
			
			for (var i:uint = 0; i < islandsData.islands.length; i++) {
				var locat:* = {};
				locat.locationMov = new moveClasses[i]();
				locat.sName = locatNames[i];
				locat.info = islandsData.islands[i]
				
				realIslandsData.push(locat as Object);
			}
			//--------------------------------------------------------------------------------
			
			BuildLocations(realIslandsData);
		}
		
	}

}








