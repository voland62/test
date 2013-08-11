package test.MyTestProject
{
	import flash.geom.Point;

	import mx.messaging.AbstractConsumer;

	import com.onlyplay.slotmatch3.components.games.match.Animations;
	import com.onlyplay.slotmatch3.components.games.match.MatchComponent;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

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

			//matchComponent.startReinitAnimation();

			var bt : Sprite = new Sprite();
			bt.graphics.beginFill(0x1dace2);
			bt.graphics.drawRoundRect(0, 0, 100, 20, 5);
			bt.graphics.endFill();

			var padding : Number = 10;
			bt.x = stage.stageWidth - bt.width - padding;
			bt.y = stage.stageHeight - bt.height - padding;
			bt.addEventListener(MouseEvent.CLICK, onSpiralMouseClick);
			addChild(bt);
		}

		private function onSpiralMouseClick(e : MouseEvent) : void
		{
			matchComponent.resetVisuals();
			//matchComponent.startReinitAnimation(onComplete);
			matchComponent.playShuffleAnimation();
			var center : Point = new Point(matchComponent.width >> 1, matchComponent.height >> 1);
			Animations.spiralVideo(matchComponent.animBase, center);

//			function onComplete() : void
//			{
//				// matchComponent.playBangAnimation();
//			}
		}
	}
}
