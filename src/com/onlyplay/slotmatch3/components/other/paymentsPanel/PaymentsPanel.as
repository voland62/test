package com.onlyplay.slotmatch3.components.other.paymentsPanel
{
	import spark.components.Button;
	import spark.components.SkinnableDataContainer;

	import com.onlyplay.slotmatch3.view.dialogs.IPaymentsView;

	import org.apache.flex.collections.ArrayList;

	import mx.core.ClassFactory;
	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Andrew
	 */
	public class PaymentsPanel extends SkinnableDataContainer implements IPaymentsView
	{
		[SkinPart]
		public var button:Button;
		
		public function PaymentsPanel()
		{
			super();
			setStyle("skinClass", PaymenstPanelSkin);
			itemRenderer = new ClassFactory ( PaymentsPanelItemRenderer );
		}

		public function setList(multiplayersList : Array) : void
		{
			dataProvider = new ArrayList(  multiplayersList );
		}
		
		
		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);
			if ( instance == button )
			{
				button.addEventListener(MouseEvent.CLICK, onButtonClick);
			}
		}
		
		private function onButtonClick( e:MouseEvent ):void
		{
			dispatchEvent(new DynamicEvent("showPaymentsDialog"));
		}
		
	}
}
