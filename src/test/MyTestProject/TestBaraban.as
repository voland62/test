package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.Util;
	import com.onlyplay.slotmatch3.components.games.slot.Baraban;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Andrew
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="640", height="480")]
	public class TestBaraban extends Sprite
	{
		private var baraban : Baraban; 
		public function TestBaraban()
		{
			
			baraban= new Baraban();
			addChild(baraban);
			
												
			var bt:Sprite = new Sprite();
			bt.graphics.beginFill(0x1dace2);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();
			
			var padding:Number = 10;
			bt.x = stage.stageWidth - bt.width - padding;
			bt.y = stage.stageHeight - bt.height - padding;
			bt.addEventListener(MouseEvent.CLICK, onSpinMouseClick);
			addChild(bt);
			
			addEventListener(Event.ADDED_TO_STAGE, onStage);
			
			
		}

		private function onStage(e: Event) : void
		{
			baraban.x = (stage.stageWidth - baraban.width) * 0.5;
			baraban.y = (stage.stageHeight - baraban.height) * 0.5;
		}
		
		

		

		private function onSpinMouseClick(e : MouseEvent) : void
		{
			//log("TestSlots.onSpinMouseClick(e)");
			var newState:Array = [Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12),Util.randInt(12)];
			baraban.spin(newState, 3);
		}
	}
}
