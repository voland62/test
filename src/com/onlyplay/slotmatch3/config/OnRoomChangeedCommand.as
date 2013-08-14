package com.onlyplay.slotmatch3.config
{
	import robotlegs.bender.bundles.mvcs.Command;

	/**
	 * @author Andrew
	 */
	public class OnRoomChangeedCommand extends Command
	{
		override public function execute() : void
		{
			log("OnRoomChangeedCommand.execute()");
		}
	}
}
