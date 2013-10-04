package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.Util;
	import com.onlyplay.slotmatch3.components.games.slot.Baraban;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	/**
	 * @author Andrew
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="640", height="480")]
	public class TestBaraban extends Sprite
	{
		private var baraban : Baraban;

		public function TestBaraban()
		{
			var dict : Dictionary = new Dictionary();
			var itemsTypesNum : int = 12;

			var islandId : int = 4;
			var locationId : int = 2;

			for (var i : int = 0; i < itemsTypesNum; i++)
			{
				dict[i] = Util.getIconUrl(islandId, locationId, i);
				// log(dict[i]);
			}

			var newState : Array = [3, 3, 3, 3, 3];

			baraban = new Baraban();
			baraban.init(dict, newState);
			addChild(baraban);

			var bt : Sprite = new Sprite();
			bt.graphics.beginFill(0x1dace2);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();

			var padding : Number = 10;
			bt.x = stage.stageWidth - bt.width - padding;
			bt.y = stage.stageHeight - bt.height - padding;
			bt.addEventListener(MouseEvent.CLICK, onSpinMouseClick);
			addChild(bt);

			// ------------
			var bt2 : Sprite = new Sprite();
			bt2.graphics.beginFill(0xff8000);
			bt2.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt2.graphics.endFill();
			bt2.x = stage.stageWidth - bt2.width - padding;
			bt2.y = stage.stageHeight - bt2.height - bt.height - padding - padding;
			bt2.addEventListener(MouseEvent.CLICK, onStopMouseClick);
			addChild(bt2);

			addEventListener(Event.ADDED_TO_STAGE, onStage);
		}

		private function onStopMouseClick(e : MouseEvent) : void
		{
			// var newState : Array = [Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12)];
			var newState : Array = [4, 4, 4, 4, 4];
			baraban.stopRequest(newState);
		}

		private function onStage(e : Event) : void
		{
			baraban.x = (stage.stageWidth - baraban.width) >> 1;
			baraban.y = (stage.stageHeight - baraban.height) >> 1;
		}

		private function onSpinMouseClick(e : MouseEvent) : void
		{
			// log("TestSlots.onSpinMouseClick(e)");
			// var newState : Array = [Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12)];
			// var newState:Array = [ ];

			baraban.spin(NaN);
		}
	}
}
