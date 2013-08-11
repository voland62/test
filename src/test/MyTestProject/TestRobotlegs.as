package test.MyTestProject
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import test.MyTestProject.config.MyAppConfig;

	import flash.display.Sprite;

	/**
	 * @author Design3d
	 */
	public class TestRobotlegs extends Sprite
	{
		private var _context : IContext;
		public function TestRobotlegs()
		{
			_context = new Context()
				.install(MVCSBundle)
				.configure(MyAppConfig)
				.configure(new ContextView(this));
				
				
			stage.addEventListener(MouseEvent.CLICK, onClick);
			
			
		}

		private function onClick(e : MouseEvent) : void
		{
			log("TestRobotlegs.onClick(e)");
			var event : Event = new Event("cool");
			dispatchEvent(event);
		}
	}
}
