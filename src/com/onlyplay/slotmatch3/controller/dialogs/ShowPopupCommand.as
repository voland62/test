package com.onlyplay.slotmatch3.controller.dialogs
{
	import com.onlyplay.slotmatch3.components.dialogs.flex.UnderConstructuionPupUp;
	import spark.components.Alert;
	import com.onlyplay.slotmatch3.components.lobby_smith.LevelInfoPopup;
	import com.onlyplay.slotmatch3.components.dialogs.flex.ToSlotPopUp;
	import com.onlyplay.slotmatch3.components.dialogs.flex.Profile;
	import com.onlyplay.slotmatch3.components.dialogs.flex.TimeOverPopup;
	import com.onlyplay.slotmatch3.components.dialogs.flex.PaymentsTablePopUp;
	import com.onlyplay.slotmatch3.view.dialogs.IPaymentsPopup;

	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	import robotlegs.bender.framework.api.IInjector;

	import mx.core.FlexGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.events.DynamicEvent;
	import mx.managers.PopUpManager;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class ShowPopupCommand extends Command
	{
		[Inject]
		public var e : DynamicEvent;
		[Inject]
		public var mediatorMap : IMediatorMap;
		[Inject]
		public var injector : IInjector;
		[Inject]
		public var viewManager : IViewManager;

		override public function execute() : void
		{
			// log("ShowPopupCommand.execute()");
			var clas : Class;

			switch(e.type)
			{
				case "showPaymentsDialog":
					clas = PaymentsTablePopUp;
					break;
				case "showProfile":
					clas = Profile;
					break;
				case "timerFinish":
					clas = TimeOverPopup;
					break;
				case "showToMapMediator":
					clas = ToSlotPopUp;
					break;
				case "showInterLevelPupup":
					clas = LevelInfoPopup;
					break;
				case "underConstruction":
					clas = UnderConstructuionPupUp;
					break;
				default:
					log("There ins't popup for event:" + e.type);
			}

			if (clas)
			{
				var popup : IFlexDisplayObject = new clas();
				viewManager.addContainer(popup as DisplayObjectContainer); // mediation
				popup.addEventListener("close", onClose);
				PopUpManager.addPopUp(popup, FlexGlobals.topLevelApplication as DisplayObject, true );
				PopUpManager.centerPopUp(popup);
			}

			// if ( e.interface_ )
			// {
			// var interface_ : Class = e.interface_;
			// var clas : Class;
			//
			// switch(interface_)
			// {
			// case IPaymentsPopup:
			// clas = PaymentsTablePopUp;
			// break;
			// default:
			// }
			//
			// var popup : IFlexDisplayObject = new clas();
			//				//  injector.getOrCreateNewInstance(interface_);//injector.getInstance(interface_);
			//
			//				//  new PopupClass();
			//				//  log(popup);
			//				//  mediatorMap.mediate(popup);
			// viewManager.addContainer(popup as DisplayObjectContainer);
			//
			// popup.addEventListener("close", onClose);
			// PopUpManager.addPopUp(popup, FlexGlobals.topLevelApplication as DisplayObject, true);
			// PopUpManager.centerPopUp(popup);
			// }
		}

		private function onClose(e : Event) : void
		{
			PopUpManager.removePopUp(e.currentTarget as IFlexDisplayObject);
		}
	}
}
