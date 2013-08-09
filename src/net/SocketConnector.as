package net
{
	import mx.events.DynamicEvent;

	import com.netease.protobuf.Message;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	/**
	 * @author Design3d
	 */
	public class SocketConnector extends EventDispatcher implements IConnector
	{
		private var socket : Socket;

		public function SocketConnector()
		{
			socket = new Socket();
			socket.endian = Endian.LITTLE_ENDIAN;
			configureListeners(socket);
		}

		private function configureListeners(socket : EventDispatcher) : void
		{
			socket.addEventListener(Event.CLOSE, closeHandler);
			socket.addEventListener(Event.CONNECT, connectHandler);
			socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
		}

		private function closeHandler(event : Event) : void
		{
			log("closeHandler: " + event);
		}

		private function connectHandler(event : Event) : void
		{
			log("connectHandler: " + event);
			dispatchEvent(new Event("onConnect"));
		}

		private function makeEnvelope(package_id : int, messageLength : int) : ByteArray
		{
			var envelope : ByteArray = new ByteArray();
			envelope.endian = Endian.LITTLE_ENDIAN;
			envelope.writeShort(0);
			envelope.writeShort(package_id);
			envelope.writeShort(messageLength);
			envelope.writeShort(0);
			return envelope;
		}

		private function ioErrorHandler(event : IOErrorEvent) : void
		{
			log("ioErrorHandler: " + event);
		}

		private function securityErrorHandler(event : SecurityErrorEvent) : void
		{
			log("securityErrorHandler: " + event);
		}

		private var currentEnvelope : ByteArray;

		private function socketDataHandler(e : ProgressEvent) : void
		{
			log("socketDataHandler: " + e);
			parseData();
		}

		private function parseData() : void
		{
			if ( currentEnvelope )
			{
				var res : Array = getPackeageLength(currentEnvelope);
				var packageLength : int = res[1];
				var packageId : int = res[0];

				if ( socket.bytesAvailable >= packageLength ) // detecting if the end of package
				{	
					var m : ByteArray = new ByteArray();
					m.endian = Endian.LITTLE_ENDIAN;
					socket.readBytes(m, 0, packageLength);

					var vo : com.netease.protobuf.Message;
					var messageClass : Class = MessagesMap.getMessageClassById(packageId);
					if (messageClass)
					{
						vo = new messageClass();
						vo.mergeFrom(m);
					}
					else
					{
						log("unknown class for packageId:" + packageId);
					}

					var event : DynamicEvent = new DynamicEvent("onMessage");

					event.message = vo;
					event.packageId = packageId;
					dispatchEvent(event);

					currentEnvelope = null;
					if (socket.bytesAvailable > 0) parseData();
				}
			}
			else
			{
				if ( socket.bytesAvailable >= 8 )
				{
					currentEnvelope = new ByteArray();
					currentEnvelope.endian = Endian.LITTLE_ENDIAN;
					socket.readBytes(currentEnvelope, 0, 8);
					
					parseData();
				}
			}
		}

		private function getPackeageLength(currentEnvelope : ByteArray) : Array
		{
			currentEnvelope.position = 0;
			currentEnvelope.readShort();
			var messageId : int = currentEnvelope.readShort();
			//log('messageId: ' + (messageId));
			var packageLength : int = currentEnvelope.readShort();
			//log('packageLength: ' + (packageLength));

			return [messageId, packageLength];
		}

		// IConnector
		public function connect(url : String, port : int) : void
		{
			log("SocketConnector.connect(url, port)");
			socket.connect(url, port);
		}

		public function send(message : com.netease.protobuf.Message, packageId : int, ...args) : void
		{
			// log("SocketConnector.send(message, args)");

			var m : ByteArray = new ByteArray();
			m.endian = Endian.LITTLE_ENDIAN;
			// trace('message.length: ' + (message.length));
			message.writeTo(m);
			// m.length;
			// trace('message.length: ' + (message.length));

			var envelope : ByteArray = makeEnvelope(packageId, m.length);

			// trace('envelope.length: ' + (envelope.length));
			envelope.writeBytes(m);
			// trace('envelope.length: ' + (envelope.length));

			// handshakeMassage.writeTo(socket);
			socket.writeBytes(envelope);
			// socket.endian = Endian.LITTLE_ENDIAN;
			socket.flush();
		}
	}
}
