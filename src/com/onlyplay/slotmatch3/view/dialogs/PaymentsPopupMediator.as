package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;

	/**
	 * @author Andrew
	 */
	public class PaymentsPopupMediator extends Mediator
	{
		[Inject]
		public var gameModel : GameModel;
		
		[Inject]
		public var view: IPaymentsPopup;
		
		override public function initialize() : void
		{
			log("---<>--PaymentsPopupMediator.initialize()");
			
			view.setList( gameModel.multipliers );
			
			
		}
	}
}
