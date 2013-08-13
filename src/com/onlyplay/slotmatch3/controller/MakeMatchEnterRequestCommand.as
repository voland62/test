package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;

	/**
	 * @author Andrew
	 */
	public class MakeMatchEnterRequestCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var service : ISlotService;

		override public function execute() : void
		{
			service.enterMatch( gameModel.win );
		}
	}
}
