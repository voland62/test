package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.components.dialogs.flex.info.InfoPopup;
	import com.onlyplay.slotmatch3.services.ISlotService;

	import mx.events.DynamicEvent;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class InfoPopupMediator extends Mediator
	{
		[Inject]
		public var view : InfoPopup;
		
		[Inject]
		public var e:DynamicEvent;
		
		[Inject]
		public var service:ISlotService;

		override public function initialize() : void
		{
			// сдесь делаем запрос на реинициализацию
			// и по ходу надо как-то скидывать юзера в лобби 
			addViewListener("close", onClose);
			addViewListener("onOk", onClose);
		}

		private function onClose ( e:Event ) : void
		{
			//service.init();
			dispatch( new Event("init") );
		}
	}
}
