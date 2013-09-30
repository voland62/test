package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.display.*;
	import com.smith.gallery.SmtHrzGallery;
	import com.smith.gallery.engine.GalleryEvent;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyCellItem;
	import flash.events.*;
	import com.onlyplay.slotmatch3.model.GameModel;
	import mx.events.DynamicEvent;
	import IslandsProtobuf;
	import flash.filters.GlowFilter;

	public class LobbyView extends Sprite {
		
		private var bg:lobby_sborka_cls;
		//private var fakeServerData:Vector.<Object>;
		private var gallery:SmtHrzGallery;
		private var posInd:Sprite;
		private var islandsData:IslandsProtobuf;
		public static var lastCursor:uint = 0;
		public static var islandName:String;
		private var locatInfoDlg:LocationInfoDlg;
		
		private var avatarData:BitmapData;
		private var avatarLayer:Bitmap;
		
		
//		[Inject]
//		public var gameModel : GameModel;
		
		
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
			bg.play_btn.addEventListener(MouseEvent.CLICK, onPlayClick);
			bg.play_btn.txt.mouseEnabled = false;
			bg.mouseEnabled=false
			addChild(bg);
			
			avatarData = new mr_bean_mini()
			avatarLayer = new Bitmap(avatarData);
			
			var kolpakData:BitmapData = new king_bg_up();
			var kolpakLayer:Bitmap = new Bitmap(kolpakData);
			kolpakLayer.x = -28;
			kolpakLayer.y = -40;
			
			bg.king_mc.addChild(avatarLayer);
			bg.king_mc.addChild(kolpakLayer);
			
			//bg.king_mc.visible = false;
			
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
			
			
			bg.lobby_header_txt.filters=[new GlowFilter(0,1,4,4,3)]
			
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
			
			
			GalleryCursorChanges(null);
			
		}
		
	
		private function onPlayClick(e:MouseEvent):void {
			var evt = new DynamicEvent("openInterLevelDlg");
			evt._type = "islandInfo";
			evt._island = lastCursor;
			evt._location = null;
			dispatchEvent(evt);
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
			
			bg.lobby_header_txt.text = gallery.dataProvider[ind].sName;
			islandName = bg.lobby_header_txt.text;
			
			//король
			bg.king_mc.visible = false;
			var kingPresent:Boolean = gallery.dataProvider[ind]["info"]["hasKing"]
			if (kingPresent)SetKing ( gallery.dataProvider[ind]["info"]["king"])
			
		}
		
		private function SetKing(data:PlayerShortProtobuf):void {
			bg.king_mc.visible = true;
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
			
			dispatchEvent(new Event("lobby:first_map_ready", true))
		}
		
	}

}








