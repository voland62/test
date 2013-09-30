package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.match.Animations;
	import com.onlyplay.slotmatch3.components.games.match.MatchComponent;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Andrew
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="1000", height="600")]
	public class TestMatchComponent extends Sprite
	{
		private var matchComponent : MatchComponent;

		public function TestMatchComponent()
		{
			matchComponent = new MatchComponent();
			
			addChild(matchComponent);
			matchComponent.reinit();

			var padding : Number = 10;
			// matchComponent.startReinitAnimation();
			
			var clr:uint = 0x1dace2; 
			
			var shuffle_bt : Sprite = makeButton(clr, "suffle");

			shuffle_bt.x = stage.stageWidth - shuffle_bt.width - padding;
			shuffle_bt.y = stage.stageHeight - shuffle_bt.height - padding;
			shuffle_bt.addEventListener(MouseEvent.CLICK, onSpiralMouseClick);
			addChild(shuffle_bt);
			
			var fallBt:DisplayObject = makeButton(clr, "fall");
			fallBt.x = shuffle_bt.x;
			fallBt.y = shuffle_bt.y - 30;
			
			fallBt.addEventListener(MouseEvent.CLICK, function (e:Event):void{
				matchComponent.resetVisuals(); 
				matchComponent.playFall();});
				
			addChild(fallBt);
			
			var dropBt:DisplayObject = makeButton(clr, "drop");
			dropBt.x = shuffle_bt.x;
			dropBt.y = shuffle_bt.y - 60;
			
			dropBt.addEventListener(MouseEvent.CLICK, function (e:Event):void{ 
				matchComponent.resetVisuals();
				matchComponent.playDrop();});
				
			addChild(dropBt);
			
		}

		private function makeButton(color : uint, lable : String) : Sprite
		{
			var bt : Sprite = new Sprite();
			bt.graphics.beginFill(color);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();
			bt.mouseChildren = false;
			
			var tf:TextField = createLabel(12, 0, false);
			bt.addChild(tf);
			tf.text = lable;

			return bt;
		}

		protected function createLabel(size : Number, color : int, bold : Boolean) : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			// tf.border = true;
			tf.height = size + 4;
			tf.textColor = color;
			tf.selectable = false;
			tf.mouseEnabled = false;

			var format : TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			format.font = "_sans";
			format.size = size;
			format.bold = bold;
			tf.defaultTextFormat = format;

			return tf;
		}

		private function onSpiralMouseClick(e : MouseEvent) : void
		{
			matchComponent.resetVisuals();
			matchComponent.playShuffleAnimation();
			var center : Point = new Point(matchComponent.width >> 1, matchComponent.height >> 1);
			Animations.spiralVideo(matchComponent.animBase, center);
		}
	}
}
