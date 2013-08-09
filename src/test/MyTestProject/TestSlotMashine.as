package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.Util;
	import com.onlyplay.slotmatch3.components.games.slot.SlotMashine;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.Font;

	/**
	 * @author Andrew
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="700", height="500")]
	public class TestSlotMashine extends Sprite
	{
		
		private var slotMashine : SlotMashine;

		public function TestSlotMashine()
		{
			
			slotMashine = new SlotMashine();
			addChild(slotMashine);

			var bt : Sprite = new Sprite();
			bt.graphics.beginFill(0x1dace2);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();

			var padding : Number = 10;
			bt.x = stage.stageWidth - bt.width - padding;
			bt.y = stage.stageHeight - bt.height - padding;
			bt.addEventListener(MouseEvent.CLICK, onSpinMouseClick);
			addChild(bt);

			addEventListener(Event.ADDED_TO_STAGE, onStage);
		}

		private function onStage(e : Event) : void
		{
			// slotMashine.x = (stage.stageWidth - slotMashine.width) * 0.5;
			// slotMashine.y = 100;//(stage.stageHeight - slotMashine.height) * 0.5;

			slotMashine.x = stage.stageWidth >> 1;
			slotMashine.y = stage.stageHeight >> 1;
		}

		private function onSpinMouseClick(e : MouseEvent) : void
		{
			// log("TestSlots.onSpinMouseClick(e)");
			// var newState:Array = [Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12),Util.randInt(12)];

			var newState : Array = [];
			for (var i : int = 0; i < 5; i++)
			{
				newState.push([Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12)]);
			}

			slotMashine.spin(newState);
		}
	}
}
