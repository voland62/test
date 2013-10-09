package com.onlyplay.slotmatch3.components.lobby_user_info {
	
	import flash.display.*;
	import com.onlyplay.util.StringUtils;
	import com.smith.graph.SmtGraphUtils;
	import com.onlyplay.util.LoadUtils;
	
	
	
	
	
	public class LobbyUserInfoView extends Sprite implements ILobbyUserInfo{
		
		internal var mov:sborka_lobby_user_info; //мувиклип плашки
		private var avatar:Bitmap; //отдельно автарка на плашке
		

		public function LobbyUserInfoView() {
			init();
		}
		
		private function init():void {
			
			mov = new sborka_lobby_user_info();
			mov.stop();
			mov.scaleX = mov.scaleY = 0.8;
			addChild(mov);
			
			avatar = new Bitmap();
			avatar.smoothing = true;
			mov.lobby_userInfo_avatar.addChild(avatar);
			
		}
		
		
		public function show(info:PlayerProtobuf):void {
			
			//аватарка
			LoadUtils.GetUserPic(info, onFotoReady);
			
			//опыт
			mov.gotoAndStop(Math.max (1, uint(info.experience / info.experienceBound * 100)))
			mov.txt_drob.text = info.experience + "/" + info.experienceBound;
			
			mov.txt_name.text = info.name; //имя
			mov.txt_red_btn.text = String(info.level);//левел
			mov.txt_score.text = StringUtils.Format3Digits(info.money);//деньги
			
		}
		
		
		public function onFotoReady(data:*):void {
			if (!data.content)return
			avatar.bitmapData = data.content.bitmapData;
			SmtGraphUtils.ResizeBitmap(avatar, 90, 90, avatar.bitmapData, 0, 0);
		}
		
		
	}

}