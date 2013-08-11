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

		private function makeEnvelope(messageLength : int) : ByteArray
		{
			var envelope : ByteArray = new ByteArray();
			envelope.endian = Endian.LITTLE_ENDIAN;
			envelope.writeShort(0);
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
				var packageLength : int = getPackeageLength(currentEnvelope);

				if ( socket.bytesAvailable >= packageLength ) // detecting if the end of package
				{
					var m : ByteArray = new ByteArray();
					m.endian = Endian.LITTLE_ENDIAN;
					socket.readBytes(m, 0, packageLength);

//					var root : Root = new Root();
//					root.mergeFrom(m);

					var event : DynamicEvent = new DynamicEvent("onMessage");

					event.message = m;
					dispatchEvent(event);

					currentEnvelope = null;
					if (socket.bytesAvailable > 0) parseData();
				}
			}
			else
			{
				if ( socket.bytesAvailable >= 6 )
				{
					currentEnvelope = new ByteArray();
					currentEnvelope.endian = Endian.LITTLE_ENDIAN;
					socket.readBytes(currentEnvelope, 0, 6);

					parseData();
				}
			}
		}

		private function getPackeageLength(currentEnvelope : ByteArray) : int
		{
			currentEnvelope.position = 0;
			currentEnvelope.readShort();

			var packageLength : int = currentEnvelope.readShort();

			return packageLength;
		}

		// IConnector
		public function connect(url : String, port : int) : void
		{
			log("SocketConnector.connect(url, port)");
			socket.connect(url, port);
		}

		public function send(message : com.netease.protobuf.Message, ...args) : void
		{
			log("SocketConnector.send(message, args)");

			var m : ByteArray = new ByteArray();
			m.endian = Endian.LITTLE_ENDIAN;
			message.writeTo(m);

			var envelope : ByteArray = makeEnvelope(m.length);
			envelope.writeBytes(m);
			socket.writeBytes(envelope);
			socket.flush();
			
		}
	}
}
