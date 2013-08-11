package com.onlyplay.slotmatch3.controller
{
	import com.onlyplay.slotmatch3.services.ISlotService;
	import robotlegs.bender.bundles.mvcs.Command;

	/**
	 * @author Design3d
	 */
	public class InitCommand extends Command
	{
		
		[Inject]
		public var service:ISlotService;
		
		override public function execute() : void
		{
			//log("---InitCommand.execute()");
			service.init();			
		}

	}
}
