package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.Parser;
	import com.onlyplay.slotmatch3.components.games.Util;
	import com.onlyplay.slotmatch3.components.games.slot.Icons;
	import com.onlyplay.slotmatch3.components.games.slot.LineVO;
	import com.onlyplay.slotmatch3.components.games.slot.SlotMashine;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;

	/**
	 * @author Andrew
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="700", height="500")]
	public class TestSlotMashine extends Sprite
	{
		private var slotMashine : SlotMashine;

		public function TestSlotMashine()
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

			// Icons.init( dict );

			slotMashine = new SlotMashine();
			slotMashine.init(dict, getTestState());
			addChild(slotMashine);

			// spin bt
			var bt : DisplayObject = createBt(0x1dace2);
			var padding : Number = 10;
			bt.x = stage.stageWidth - bt.width - padding;
			bt.y = stage.stageHeight - bt.height - padding;
			bt.addEventListener(MouseEvent.CLICK, onSpinMouseClick);
			addChild(bt);

			// anim bt
			var a_bt : DisplayObject = createBt(0xff00ff);
			// var padding : Number = 10;
			a_bt.x = stage.stageWidth - a_bt.width - padding;
			a_bt.y = stage.stageHeight - bt.height - padding - padding - a_bt.height;
			a_bt.addEventListener(MouseEvent.CLICK, onLinesBtClick);
			addChild(a_bt);
			// anim bt

			var b_bt : DisplayObject = createBt(0xff8000);
			// var padding : Number = 10;
			b_bt.x = stage.stageWidth - b_bt.width - padding;
			b_bt.y = a_bt.y - a_bt.height - padding;
			b_bt.addEventListener(MouseEvent.CLICK, onAnimWinLinesClick);
			addChild(b_bt);
			
			var c_bt : DisplayObject = createBt(0xd5006a);
			// var padding : Number = 10;
			c_bt.x = stage.stageWidth - c_bt.width - padding;
			c_bt.y = b_bt.y - b_bt.height - padding;
			c_bt.addEventListener(MouseEvent.CLICK, onStopBtClick);
			addChild(c_bt);

			addEventListener(Event.ADDED_TO_STAGE, onStage);
		}

		private function onStopBtClick(e : MouseEvent) : void
		{
			slotMashine.stopRequest( getTestState() );
		}

		private function onAnimWinLinesClick(e : MouseEvent) : void
		{

			var winLines : Array = genLines();

			slotMashine.playWinLinesAnim(winLines);
		}

		private function genLines() : Array
		{
			var newState : Array = [];
			for (var i : int = 0; i < 5; i++)
			{
				newState.push(i, i, i, i, i);
			}

			var nnn : Array = Parser.parseSpinData(newState);
			
			var line1 : LineVO = new LineVO();
			line1.points = [new Point(1, 2), new Point(2, 3), new Point(3, 3), new Point(4, 3), new Point(5, 3)];
			line1.lineId = 1;
			line1.color = 0xFF0000;
			line1.iconsCount = 2;
			line1.winIconsTypes = LineVO.calcWinTypes(line1.points, nnn);
			
			var line2 : LineVO = new LineVO();
			line2.points = [new Point(5, 3), new Point(4, 2), new Point(3, 1), new Point(2, 1), new Point(1, 1)];
			line2.lineId = 23;
			line2.color = 0xFF00FF;
			line2.iconsCount = 3;
			line2.winIconsTypes = LineVO.calcWinTypes(line2.points, nnn);
			var lines : Array = [line1, line2];
			//var lines : Array = [line1];
			return lines;
		}

		private function onLinesBtClick(e : MouseEvent) : void
		{
			var lines : Array = genLines();
			slotMashine.drawLines(lines);
		}

		private function createBt(color : int, text : String = null) : Sprite
		{
			var bt : Sprite = new Sprite();
			bt.graphics.beginFill(color);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();
			return bt;
		}

		private function onStage(e : Event) : void
		{
			// slotMashine.x = (stage.stageWidth - slotMashine.width) * 0.5;
			// slotMashine.y = 100;//(stage.stageHeight - slotMashine.height) * 0.5;

			slotMashine.x = stage.stageWidth >> 1;
			slotMashine.y = stage.stageHeight >> 1;
		}
		
		
		private function getTestState():Array
		{
			var newState : Array = [];
				for (var i : int = 0; i < 5; i++)
				{
					// newState.push([Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12)]);
					// newState.push(0,1,2,3,4);
					newState.push(i, i, i, i, i);
					// newState.push([0,1,2,3,4]);
				}
	
				return Parser.parseSpinData(newState);
			
		}

		private function onSpinMouseClick(e : MouseEvent) : void
		{
			// log("TestSlots.onSpinMouseClick(e)");
			// var newState:Array = [Util.randInt(12), Util.randInt(12), Util.randInt(12), Util.randInt(12),Util.randInt(12)];


			slotMashine.spin( );
			// slotMashine.spin( newState );
		}
	}
}
