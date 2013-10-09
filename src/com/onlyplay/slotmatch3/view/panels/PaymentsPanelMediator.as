package com.onlyplay.slotmatch3.view.panels
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	/**
	 * @author Andrew
	 */
	public class PaymentsPanelMediator extends Mediator
	{
		[Inject]
		public var view : IPaymentsPanel;
		
		override public function initialize() : void
		{
			
		}
	}
}
