package com.onlyplay.slotmatch3.config
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.services.ISlotService;

	/**
	 * @author Andrew
	 */
	public class RequestRoomProgressCommand extends Command
	{

		[Inject]
		public var service : ISlotService;
		override public function execute() : void
		{
			

		}

	}
}
