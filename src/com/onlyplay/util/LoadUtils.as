package com.onlyplay.util {
	
	import com.netease.protobuf.Message;
	import com.onlyplay.util.StringUtils;
	import com.smith.loader.KaoLoader;
	
	public class LoadUtils {
		
		
		[Embed(source="srcs/default_photo-ipadhd.png")]
		public static const defaultAvatar:Class
		
		private static const fakeAvatarObj:* = {path:"defaultAvatar", content:(new LoadUtils.defaultAvatar()) }
		
		
		public function LoadUtils() {}
		
		//отдаёт в handler графику аватарки
		public static function GetUserPic(data:Message, handler:Function):void {
			
			var url:String = GetUrl(data);
			
			if (url == "defaultAvatar") {
				handler.call(null, LoadUtils.fakeAvatarObj)
			}else{
				KaoLoader.Load( url, handler, KaoLoader.CONTENT_DATA);
			}
		}
		
		
		//конструирует url к автатру
		private static function GetUrl(info:Message):String {
			
			var out:String = ""
			
			if (info["bot"]) {
				
				out = "http://onlyplay.game-insight.com/puzzleslots/resources/bots/" 
				+ StringUtils.Strip(info["name"], " ", "")
				+ ".jpg"
				
			}else {
				
				if (info["facebookId"] != "") {
					out = "https://graph.facebook.com/" + info["facebookId"]
					+ "/picture?width=200&height=200"
				}else {
					out = "defaultAvatar"
				}
				
			}
			return out
		}
		
		
		
		
	}

}