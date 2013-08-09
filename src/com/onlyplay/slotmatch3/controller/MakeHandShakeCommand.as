package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.services.ISlotService;

	/**
	 * @author Design3d
	 */
	public class MakeHandShakeCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		
		override public function execute() : void
		{
			//log("MakeHandShakeCommand.execute()");
			service.makeHandShake();
		}
	}
}
