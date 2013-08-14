package com.onlyplay.slotmatch3.services
{
	import com.netease.protobuf.Message;
	import flash.events.Event;

	/**
	 * @author Design3d
	 */
	public class ServiceEvent extends Event
	{
		public static const PREFIX : String = "service_event_";
		public static const MAKE_HANDSHAKE : String = "MAKE_HANDSHAKE";
		public static const CHANGES:String = "changes";
		
		public var message: com.netease.protobuf.Message;
		public var packageId:int;
		
		
		public function ServiceEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		override public function clone() : Event
		{
			var event:ServiceEvent = new ServiceEvent(type, bubbles, cancelable);
			event.message = message;
			event.packageId = packageId;
			return event;
		}
		
	}
}
