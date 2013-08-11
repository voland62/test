package com.onlyplay.slotmatch3.controller
{
	import com.onlyplay.slotmatch3.services.ServiceEvent;
	import robotlegs.bender.bundles.mvcs.Command;

	/**
	 * @author Design3d
	 */
	 
	 
	public class OnPlayerStateCommand extends Command
	{
		[Inject]
		public var event : ServiceEvent;
		override public function execute() : void
		{
			log("OnPlayerStateCommand.execute()");
			log(event.message.toString());
		}
	}
}
