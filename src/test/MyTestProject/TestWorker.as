package test.MyTestProject
{
	import flash.text.TextField;
	import flash.events.Event;
	import flash.system.MessageChannel;
	import flash.system.WorkerDomain;
	import flash.system.Worker;
	import flash.display.Sprite;

	/**
	 * @author Andrew
	 */
	public class TestWorker extends Sprite
	{
		[Embed(source="D:/work/workspaces/fdt_ws/slotmatch3/bin/MyWorker.swf", mimeType="application/octet-stream")]
		private static var MyWorkerClass : Class;
		
		private var myWorker : Worker;
		private var bm : MessageChannel;
		private var mb : MessageChannel;
		private var _logTf : TextField = new TextField();

		private function log(message : Object, ...rest) : void
		{
			_logTf.appendText(String(message) + "\n"); 
			trace(message);
		}

		public function TestWorker()
		{
			addChild(_logTf);

			_logTf.border = true;
			_logTf.width = stage.stageWidth - 1;
			_logTf.height = 200;

			log("TestWorker.TestWorker()");
			myWorker = WorkerDomain.current.createWorker(new MyWorkerClass());

			bm = myWorker.createMessageChannel(Worker.current);
			mb = Worker.current.createMessageChannel(myWorker);

			myWorker.setSharedProperty("btm", bm);
			myWorker.setSharedProperty("mtb", mb);

			bm.addEventListener(Event.CHANNEL_MESSAGE, onBackToMain);

			myWorker.start();

			addEventListener(Event.ADDED_TO_STAGE, onStage);
		}

		private function onStage(e : Event) : void
		{
			mb.send("add");
			mb.send(2);
			mb.send(5);
		}

		private function onBackToMain(e : Event) : void
		{
			log("TestWorker.onBackToMain(e)");
			if (bm.messageAvailable)
			{
				if (bm.receive() == "result")
				{
					log("result is:" + bm.receive());
				}
			}
		}
	}
}
