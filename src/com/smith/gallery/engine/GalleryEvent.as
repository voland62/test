package com.smith.gallery.engine {
	
	import flash.events.Event;

	/**
	 * @author Falcao
	 */
	public class GalleryEvent extends Event {
		
		public static const CURSOR_CHANGES:String = "cursor_canges";

		public var data : *;
		
		public function GalleryEvent (type : String, dataVal : *, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
			
			data = dataVal;
		}
		
		override public function clone() : Event {
			var e : GalleryEvent  = new GalleryEvent (type, data, bubbles, cancelable);        
			return e;
		}
	}
}