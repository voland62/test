package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.match.ItemModel;
	import com.onlyplay.slotmatch3.components.games.match.Matcher_v2;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.registerClassAlias;
	import flash.system.MessageChannel;
	import flash.system.Worker;

	/**
	 * @author Andrew
	 */
	public class MyWorker extends Sprite
	{
		private var _bm : MessageChannel;
		private var _mb : MessageChannel;
		public function MyWorker()
		{
			trace("hello");
			log("MyWorker.MyWorker()");
			
			
			registerClassAlias("ItemModel_", ItemModel);
			
						
			_bm = Worker.current.getSharedProperty("btm");
			_mb = Worker.current.getSharedProperty("mtb");
			
			_mb.addEventListener(Event.CHANNEL_MESSAGE, onMainToBack);
		}
		
		private var swaps:Array = [];
		
		private function onMainToBack(e : Event) : void
		{
			trace("<----MyWorker.onMainToBack(e)");
			// TODO: read message...
			if ( _mb.messageAvailable)
			{
				var header:String = _mb.receive();
				
				if ( header == "echo")
				{
					_bm.send("echo");
				}
				
				if ( header == "add")
				{
					var res:Number = add( _mb.receive(), _mb.receive());
					sendToMain(res);
				}
				
				if ( header == "getPossibleSwaps")
				{
					var field:Array = _mb.receive();
					swaps = Matcher_v2.getPossibleSwaps(field);
					_bm.send("onGetPossibleSwaps");
					_bm.send(swaps);
					//_bm.send(field);
				}
			}
		}

		private function sendToMain( result:Number ) : void
		{
			_bm.send("result");
			_bm.send( result);
		}
		
		
		public function add (a:Number, b:Number):Number
		{
			return a + b;
		}
		
	}
}
