package com.onlyplay.slotmatch3.components.lobby_smith {
	
	import flash.display.*;
	import flash.net.*;
	import flash.system.*;
	import com.smith.gallery.SmtHrzGallery;
	import com.smith.gallery.engine.GalleryEvent;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyCellItem;
	import flash.events.*;
	import com.onlyplay.slotmatch3.model.GameModel;
	import mx.events.DynamicEvent;
	import IslandsProtobuf;
	import flash.filters.GlowFilter;
	import mx.core.FlexGlobals

	public class LobbyView extends Sprite {
		
		private var bg:lobby_sborka_cls;
		private var gallery:SmtHrzGallery;
		private var posInd:Sprite;
		private var islandsData:IslandsProtobuf;
		public static var lastCursor:uint = 0;
		public static var islandName:String;
		private var locatInfoDlg:LocationInfoDlg;
		
		private var avatarData:BitmapData;
		private var avatarLayer:Bitmap;
		
		

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
			
			bg.lobby_isl_info_btn.addEventListener(MouseEvent.CLICK, onInfoClick);
			
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
				cell.x = i * 20 + 30;
				posInd.addChild(cell);
				cell.scaleX=cell.scaleY=0.9
				
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
		
		//по приходу или изменению данных о мире
		internal function onDataArrive(evt:DynamicEvent):void{
			
			islandsData = evt.data;
			
			//типа пришли данные с сервака 
			var realIslandsData:Vector.<Object> = new Vector.<Object>();
			
			var moveClasses:Vector.<Class> = Vector.<Class>([hawaii_island, amazone_island, archipelago_island, pirate_island]);
			var locatNames:Vector.<String> = Vector.<String>(["Гавайский остров", "Амазонка", "Подводный архипелаг", "Пиратский остров"])
			
			//определяем данные, названия и мувиклипы островов
			for (var i:uint = 0; i < islandsData.islands.length; i++) {
				var locat:* = {};
				locat.locationMov = new moveClasses[i]();
				locat.sName = locatNames[i];
				locat.info = islandsData.islands[i]
				
				realIslandsData.push(locat as Object);
			}
			//--------------------------------------------------------------------------------
			
			BuildLocations(realIslandsData);
			
			//событие данные пришли первый раз - первая карта загружена - снимаем прелоадер
			if (FlexGlobals.topLevelApplication.getObjById("prldrHolder")){
				dispatchEvent(new Event("lobby:first_map_ready", true));
			}
		}
		
		
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
			
			//определяем текущий курсор галлереи
			GalleryCursorChanges(null);
		}
		
	
		
		
		
		//текущий остров изменился
		public function GalleryCursorChanges(e:GalleryEvent = null):void {
			
			var ind:uint;
			
			if (e == null) {
				ind = lastCursor; 
			}else {
				ind = e.data.newCursor;
				lastCursor = ind;
			}
			//индикатор 4 точки
			SetPositIndicator(ind);
			
			bg.lobby_header_txt.text = gallery.dataProvider[ind].sName;
			islandName = bg.lobby_header_txt.text;
			
			//устанавливаем короля 
			bg.king_mc.visible = false;
			bg.king_mc.scaleX = bg.king_mc.scaleY = 0.75
			
			for (var i:uint = 0; i < 2; i++ ) {
				Bitmap(bg.king_mc.getChildAt(i)).smoothing = true
			}
			
			var kingPresent:Boolean = gallery.dataProvider[ind]["info"]["hasKing"]
			if (kingPresent)SetKing ( gallery.dataProvider[ind]["info"]["king"])
			
		}
		
		
		
		//визуализируем короля и его аватарку
		private function SetKing(data:PlayerShortProtobuf):void {
			bg.king_mc.visible = true;
			
			var sFacebookName:String = "100006286838105";//например
			
			var ldr:Loader = new Loader();
			ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onPicReady);
			var req:URLRequest = new URLRequest("https://graph.facebook.com/" + sFacebookName + "/picture");
			
			if(Security.sandboxType == "remote"){
				var ldrCntxt:LoaderContext = new LoaderContext(true);
				ldrCntxt.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
				ldrCntxt.securityDomain = SecurityDomain.currentDomain;
			}else {
				ldrCntxt = null;
			}
		
			ldr.load(req, ldrCntxt);
			
		}
		
		//аватарка короля пришла
		private function onPicReady(e:Event):void {
			var bmp:Bitmap = bg.king_mc.getChildAt(0) as Bitmap;
			bmp.bitmapData =  e.currentTarget.loader.content.bitmapData
			
		}
		
		
		
		
		private function onPlayClick(e:MouseEvent):void {
			var evt:DynamicEvent = new DynamicEvent("openInterLevelDlg");
			evt._locType = "islandInfo";
			evt._island = lastCursor;
			evt._location = -1;
			dispatchEvent(evt);
		}
		
		
		
		private function onInfoClick(e:MouseEvent):void {
			dispatchEvent(new DynamicEvent("underConstruction"));
		}
		
		
	}

}








