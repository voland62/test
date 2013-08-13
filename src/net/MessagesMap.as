package net
{
	import flash.utils.Dictionary;

	/**
	 * @author Design3d
	 */
	public class MessagesMap
	{
		private static var map : Dictionary = initMap();

		private static function initMap() : Dictionary
		{
			var map : Dictionary = new Dictionary();
			
			map[2000] = LoginRequestProtobuf;
			map[1000] = LoginResponseProtobuf;
			
			map[2100] = LocationEnterRequestProtobuf;
			map[1100] = LocationEnterResponseProtobuf;
			
			map[2200] = SpinRequestProtobuf;
			map[1200] = SpinResponseProtobuf;
			
			map[2300] = MatchEnterRequestProtobuf;
			map[1300] = MatchEnterResponseProtobuf;
			
//			map[ 2001 ] = ClientHandShakeProtobuf;
//			map[ 1001 ] = ServerHandShakeProtobuf;
//			map[ 1003 ] = ServerConfigProtobuf;
//			map[ 2005 ] = PlayerLoginRequestProtobuf;
//			map[ 1005 ] = PlayerLoginResponseProtobuf;
//			
//			//map[ 2011 ] = ClientEnterLocationProtobuf;
//			//map[ 1011 ] = ServerRoomConfigProtobuf;
//			map[ 2300 ] = ClientRoomEnterProtobuf;
//			map[ 1300 ] = ServerRoomStateProtobuf;
//			
//			
//			map[ 1010 ] = ServerPlayerStateProtobuf;
//			map[ 2031 ] = ClientSpinProtobuf;
//			map[ 1031 ] = ServerSpinProtobuf;
//			map[ 1023 ] = ServerTileIndexProtobuf;
//			map[ 2100 ] = PlayerDataLoadRequestProtobuf;
//			map[ 1100 ] = PlayerDataLoadResponseProtobuf;
//			
//			map[ 2310 ] = ClientRoomProgressProtobuf;
//			map[ 1310 ] = ServerRoomPlayerStateProtobuf;
			return map;
		}

		public static function getMessageClassById(packageId : int) : Class
		{
			return map[packageId];
		}
		
		public static function getIdByClass(clas:Class):int
		{
			for (var packageId : * in map) {
				if (map[packageId] == clas) return packageId;
			}
			return 0;
		}
	}
}
