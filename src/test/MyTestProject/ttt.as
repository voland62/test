package test.MyTestProject
{
	import net.IConnector;
	import net.MessagesMap;
	import net.SocketConnector;

	import com.netease.protobuf.Message;

	import mx.events.DynamicEvent;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class ttt extends Sprite
	{
		private var connector : IConnector;
		private var _readyToPlay : Boolean;

		public function ttt()
		{
			trace("ttt.ttt()");

			var serverUrl : String = "192.168.1.100";
			var port : int = 12800;

			connector = new SocketConnector();
			connector.addEventListener("onConnect", onConnect);
			connector.addEventListener("onMessage", onMessage);
			connector.connect(serverUrl, port);

			// ----- button ------------------
			var bt : Sprite = new Sprite();
			bt.graphics.beginFill(0x1dace2);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();

			var padding : Number = 10;
			bt.x = stage.stageWidth - bt.width - padding;
			bt.y = stage.stageHeight - bt.height - padding;
			bt.addEventListener(MouseEvent.CLICK, onSpinMouseClick);
			addChild(bt);
		}

		private function onSpinMouseClick(e : MouseEvent) : void
		{
			log("ttt.onSpinMouseClick(e)");

			if (_readyToPlay)
			{
				var packageId :int = MessagesMap.getIdByClass(ClientSpinProtobuf);
				var message : ClientSpinProtobuf = new ClientSpinProtobuf();
				message.linesQuantity = 1;
				message.betAmount = 1;
				connector.send(message, packageId);
			}
		}

		private function onMessage(e : DynamicEvent) : void
		{
			log(e.packageId);
			if (e.message)
			{
				log("ttt.onMessage(e):" + (e.message as com.netease.protobuf.Message).toString());
			}

			if (e.packageId == 1003)
			{
				// send login
				var packageId : int = MessagesMap.getIdByClass(PlayerLoginRequestProtobuf);
				var message : PlayerLoginRequestProtobuf = new PlayerLoginRequestProtobuf();
				message.gameId = 0;
				// новый?
				connector.send(message, packageId);
			}

			if ( e.packageId == 1005) // on login
			{
				var respond : PlayerLoginResponseProtobuf = e.message as PlayerLoginResponseProtobuf;

				if ( respond.status == 1)
				{
					// enter location
					sendEnterLocation();
				}
			}

			if ( e.packageId == 1011)
			{
				var respond_ : ServerRoomConfigProtobuf = e.message as ServerRoomConfigProtobuf;
				_readyToPlay = true;
			}
			
			if ( e.packageId == 1031)// spin response
			{
				var resp:ServerSpinProtobuf = e.message as ServerSpinProtobuf;
				log('resp.stack.iconInfo.length: ' + (resp.stack.iconInfo.length));
			}
			
			
			
			
		}

		private function sendEnterLocation() : void
		{
			log("ttt.sendEnterLocation()");
			var packageId : int = MessagesMap.getIdByClass(ClientEnterLocationProtobuf);
			var message : ClientEnterLocationProtobuf = new ClientEnterLocationProtobuf();
			message.islandId = 1;
			message.locationId = 1;
			connector.send(message, packageId);
		}

		private function onConnect(e : Event) : void
		{
			log("ttt.onConnect(e)");

			// sending handshake
			var handshakeMassage : ClientHandShakeProtobuf = new ClientHandShakeProtobuf();
			var packageId : int = MessagesMap.getIdByClass(ClientHandShakeProtobuf);
			connector.send(handshakeMassage, packageId);
		}
	}
}
