package com.onlyplay.slotmatch3.services
{
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
			var port : int = 12800;

			connector.addEventListener("onConnect", onConnect);
			connector.addEventListener("onMessage", onMessage);

			connector.connect(serverUrl, port);
		}

		private function onMessage(e : DynamicEvent) : void
		{
			log("SlotService.onMessage(e)");
			log("e.packageId:" + e.packageId);
			// Здесь мы диспатчим любой приход от сокета, а подписчики (это команды большей частью) - уже обрабатывают
			var event : ServiceEvent = new ServiceEvent(ServiceEvent.PREFIX + e.packageId);
			event.message = e.message;
			event.packageId = e.packageId;
			eventDispatcher.dispatchEvent(event);
		}

		private function onConnect(e : Event) : void
		{
			log("ttt.onConnect(e)");

			// старт хэндшейк
			eventDispatcher.dispatchEvent(new ServiceEvent(ServiceEvent.MAKE_HANDSHAKE));
		}

		public function login(gameId:int) : void
		{
			log("SlotService.login()");
			// send login
			var packageId : int = MessagesMap.getIdByClass(PlayerLoginRequestProtobuf);
			var message : PlayerLoginRequestProtobuf = new PlayerLoginRequestProtobuf();
			// новый?
			message.gameId = gameId;
			connector.send(message, packageId);
		}

		public function makeHandShake() : void
		{
			// sending handshake
			var handshakeMassage : ClientHandShakeProtobuf = new ClientHandShakeProtobuf();
			var packageId : int = MessagesMap.getIdByClass(ClientHandShakeProtobuf);
			connector.send(handshakeMassage, packageId);
		}

//		public function enterLocation() : void
//		{
//			var packageId : int = MessagesMap.getIdByClass(ClientEnterLocationProtobuf);
//			var message : ClientEnterLocationProtobuf = new ClientEnterLocationProtobuf();
//			message.islandId = 1;
//			message.locationId = 1;
//			connector.send(message, packageId);
//		}

		public function enterRoom() : void
		{
			var packageId:int = MessagesMap.getIdByClass(ClientRoomEnterProtobuf);
			var message : ClientRoomEnterProtobuf = new ClientRoomEnterProtobuf();
			message.islandId = 1;
			message.locationId = 1;
			connector.send(message, packageId);
		}
		
		public function spin(linesQuantity:int, betAmount :int) : void
		{
			var packageId : int = MessagesMap.getIdByClass(ClientSpinProtobuf);
			var message : ClientSpinProtobuf = new ClientSpinProtobuf();
			message.linesQuantity = linesQuantity;
			message.betAmount = betAmount;
			connector.send(message, packageId);
		}

		public function getUserData(gameId:int) : void
		{
			var packageId : int = MessagesMap.getIdByClass(PlayerDataLoadRequestProtobuf);
			var message : PlayerDataLoadRequestProtobuf = new PlayerDataLoadRequestProtobuf ();
			
			message.needInfo = true;
			message.needAmulet = true;
			//message.linesQuantity = linesQuantity;
			//message.betAmount = betAmount;
			connector.send(message, packageId);
			
		}

		public function dispatchLastProgressToAll(win : Number) : void
		{
			var packageId:int = MessagesMap.getIdByClass(ClientRoomProgressProtobuf);
			var message:ClientRoomProgressProtobuf = new ClientRoomProgressProtobuf();
			message.progress = win;
			message.experience = 0;
			connector.send(message, packageId);
		}

	}
}
