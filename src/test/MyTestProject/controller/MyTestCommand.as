package test.MyTestProject.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	/**
	 * @author Design3d
	 */
	public class MyTestCommand extends Command
	{
		override public function execute() : void
		{
			log("MyTestCommand.execute()");
		}

	}
}
