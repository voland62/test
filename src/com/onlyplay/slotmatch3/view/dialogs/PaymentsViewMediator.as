package com.onlyplay.slotmatch3.view.dialogs
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.model.GameModel;

	import flash.events.Event;

	/**
	 * @author Andrew
	 */
	public class PaymentsViewMediator extends Mediator
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var view : IPaymentsView;

		override public function initialize() : void
		{
			// log("---<>--PaymentsPopupMediator.initialize()");

			// view.setList( gameModel.multipliers );
			update(null);
			addContextListener("ready", update);
			addViewListener("showPaymentsDialog", dispatch);
		}

		private function update(e : Event) : void
		{
			view.setList(gameModel.multipliers);
		}
	}
}
