package com.onlyplay.slotmatch3.services
{
	import flash.utils.Endian;
	import flash.utils.ByteArray;

	import com.netease.protobuf.Message;

	import mx.events.DynamicEvent;

	import flash.events.IEventDispatcher;

	import net.IConnector;
	import net.MessagesMap;

	import flash.events.Event;

	/**
	 * @author Design3d
	 */
	public class SlotService implements ISlotService
	{
		[Inject]
		public var connector : IConnector;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		public function init() : void
		{
			// TODO: вынести в конфиг
			var serverUrl : String = "10.0.1.100";
			// var serverUrl : String = "213.160.129.246";
			var port : int = 12801;

			connector.addEventListener("onConnect", onConnect);
			connector.addEventListener("onMessage", onMessage);

			connector.connect(serverUrl, port);
		}

		private function onMessage(e : DynamicEvent) : void
		{
			log("SlotService.onMessage(e)");
			// log("e.packageId:" + e.packageId);
			// Здесь мы диспатчим любой приход от сокета, а подписчики (это команды большей частью) - уже обрабатывают

			var root : Root = new Root();
			root.mergeFrom(e.message);

			var event : ServiceEvent = new ServiceEvent(ServiceEvent.PREFIX + root.packageId);

			event.packageId = root.packageId;

			var messsageClass : Class = MessagesMap.getMessageClassById(root.packageId);
			if ( messsageClass )
			{
				var message : Message = new messsageClass();
				message.mergeFrom(root.packageData);
				event.message = message;
				eventDispatcher.dispatchEvent(event);
			}
			else
			{
				log("message class not found for id:" + root.packageId);
			}
		}

		private function onConnect(e : Event) : void
		{
			log("ttt.onConnect(e)");

			// старт хэндшейк
			// eventDispatcher.dispatchEvent(new ServiceEvent(ServiceEvent.));
			// TODO: вынести в комманду
			var gameId : int = 0;
			login(gameId);
		}

		public function login(gameId : int) : void
		{
			log("SlotService.login()");
			// send login

			var packageId : int = MessagesMap.getIdByClass(LoginRequestProtobuf);

			var message : LoginRequestProtobuf = new LoginRequestProtobuf();
			var deviceInfo : DeviceInfoProtobuf = new DeviceInfoProtobuf();
			deviceInfo.clientVersion = "";
			deviceInfo.udid = "flash";
			message.deviceInfo = deviceInfo;
			message.gameId = 0;

			send(message, packageId);
		}

		private function send(message : Message, packageId : int) : void
		{
			connector.send(packInRoot(message, packageId));
		}

		private function packInRoot(message : Message, packageId : int) : Root
		{
			var root : Root = new Root();
			root.packageId = packageId;
			root.sessionKey = 0;
			root.timestamp = new Date().time * 0.001;

			var ba : ByteArray = new ByteArray();
			ba.endian = Endian.LITTLE_ENDIAN;
			message.writeTo(ba);
			root.packageData = ba;
			return root;
		}

		// public function makeHandShake() : void
		// {
		//			//  sending handshake
		// var handshakeMassage : ClientHandShakeProtobuf = new ClientHandShakeProtobuf();
		// var packageId : int = MessagesMap.getIdByClass(ClientHandShakeProtobuf);
		// connector.send(handshakeMassage, packageId);
		// }
		// public function enterLocation() : void
		// {
		// var packageId : int = MessagesMap.getIdByClass(ClientEnterLocationProtobuf);
		// var message : ClientEnterLocationProtobuf = new ClientEnterLocationProtobuf();
		// message.islandId = 1;
		// message.locationId = 1;
		// connector.send(message, packageId);
		// }
		public function enterRoom() : void
		{
			// var packageId:int = MessagesMap.getIdByClass(ClientRoomEnterProtobuf);
			// var message : ClientRoomEnterProtobuf = new ClientRoomEnterProtobuf();
			// message.islandId = 1;
			// message.locationId = 1;
			// connector.send(message, packageId);
		}

		public function enterLocation(islandId : int, locatinId : int) : void
		{
			var packageId : int = MessagesMap.getIdByClass(LocationEnterRequestProtobuf);
			var message : LocationEnterRequestProtobuf = new LocationEnterRequestProtobuf();
			message.islandId = islandId;
			message.locationId = locatinId;
			send(message, packageId);
		}

		public function spin(linesQuantity : int, betAmount : int) : void
		{
			var packageId : int = MessagesMap.getIdByClass(SpinRequestProtobuf);
			var message : SpinRequestProtobuf = new SpinRequestProtobuf();
			message.bet = betAmount;
			message.linesAmount = linesQuantity;
			send(message, packageId);
		}

		public function getUserData(gameId : int) : void
		{
			// var packageId : int = MessagesMap.getIdByClass(PlayerDataLoadRequestProtobuf);
			// var message : PlayerDataLoadRequestProtobuf = new PlayerDataLoadRequestProtobuf ();
			//			
			// message.needInfo = true;
			// message.needAmulet = true;
			//			//  message.linesQuantity = linesQuantity;
			//			//  message.betAmount = betAmount;
			// connector.send(message, packageId);
		}

		public function dispatchLastProgressToAll(win : Number) : void
		{
			// var packageId:int = MessagesMap.getIdByClass(ClientRoomProgressProtobuf);
			// var message:ClientRoomProgressProtobuf = new ClientRoomProgressProtobuf();
			// message.progress = win;
			// message.experience = 0;
			// connector.send(message, packageId);
		}

		public function enterMatch( lastWinFromSpin:Number) : void
		{
			var packageId : int = MessagesMap.getIdByClass(MatchEnterRequestProtobuf);
			var message : MatchEnterRequestProtobuf = new MatchEnterRequestProtobuf();
			message.money = lastWinFromSpin;
			send(message, packageId);
		}
	}
}
