package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * @author Design3d
	 */
	public class SlotMashine extends Sprite
	{
		[Embed(source="/assets/facebook/facebook/baraban/baraban.png", mimeType="image/png")]
		private static var BarabanClass : Class;
		[Embed(source="/assets/facebook/facebook/baraban/c3.png", mimeType="image/png")]
		private static var ChanesBottomClass : Class;
		[Embed(source="/assets/facebook/facebook/baraban/c1.png", mimeType="image/png")]
		private static var ChanesTop1Class : Class;
		[Embed(source="/assets/facebook/facebook/baraban/c2.png", mimeType="image/png")]
		private static var ChanesTop2Class : Class;
		private var barabansNum : int = 5;
		private var _bg : Bitmap;
		private var _baranans : Array = [];
		private var _mask : Sprite = new Sprite();
		private var _barabansBase : Sprite = new Sprite;
		private var _leftLinesPanel : LinesPanel;
		private var _rightLinesPanel : LinesPanel;
		private var _chanesBottomLeft : Bitmap;
		private var _chanesBottomRight : Bitmap;
		private var _chanesTop1Left : Bitmap;
		private var _chanesTop1Right : Bitmap;
		private var _chanesTop2Left : Bitmap;
		private var _chanesTop2Right : Bitmap;
		private var _linesBase : Shape = new Shape();

		public function SlotMashine()
		{
			// var delta:Point = new Point(-20, -46);
			_bg = new BarabanClass();
			// _bg.x = delta.x;
			// _bg.y = delta.y;
			addChild(_bg);

			addChild(_barabansBase);

			for (var i : int = 0; i < barabansNum; i++)
			{
				var baraban : Baraban = new Baraban();
				baraban.x = i * (baraban.width + 1);

				_baranans.push(baraban);
				_barabansBase.addChild(baraban);
			}

			// _barabansBase.y = -baraban._itemHeight + 12;

			// _mask.graphics.lineStyle(1, 0xFF0000);

			_mask.graphics.beginFill(0);
			_mask.graphics.drawRect(0, 0, _barabansBase.width, 259);
			_mask.graphics.endFill();
			addChild(_mask);
			_barabansBase.mask = _mask;

			// --- chanes -------------------------

			_chanesTop1Left = new ChanesTop1Class();
			addChild(_chanesTop1Left);

			_chanesTop1Right = new ChanesTop1Class();
			addChild(_chanesTop1Right);
			_chanesTop1Right.scaleX = -1;

			_chanesTop2Left = new ChanesTop2Class();
			addChild(_chanesTop2Left);

			_chanesTop2Right = new ChanesTop2Class();
			addChild(_chanesTop2Right);
			_chanesTop2Right.scaleX = -1;

			_chanesBottomLeft = new ChanesBottomClass();
			addChild(_chanesBottomLeft);

			_chanesBottomRight = new ChanesBottomClass();
			addChild(_chanesBottomRight);
			_chanesBottomRight.scaleX = -1;

			// --- panels ---------------------------

			_leftLinesPanel = new LinesPanel();
			addChild(_leftLinesPanel);

			_rightLinesPanel = new LinesPanel(LinesPanel.RIGHT);
			addChild(_rightLinesPanel);

			var filter : DropShadowFilter = new DropShadowFilter();
			filter.inner = true;
			//filter.blurX = -1;
			//filter.blurY = -1;
			//filter.distance = 1;
			//_linesBase.filters = [filter];
			addChild(_linesBase);

			refresh();

			//drawLines([[[2, 3], [3, 5]]]);
		}

		private function  refresh() : void
		{
			_bg.x = -(_bg.width >> 1) + 1;// коррекция на пискель
			// тут может быть поправка - зависящая от самого изображения
			_bg.y = -(_bg.height >> 1) - 5;
			_barabansBase.x = -(_barabansBase.width >> 1);
			_barabansBase.y = -(_barabansBase.height >> 1);

			_mask.x = -(_mask.width >> 1);
			_mask.y = -(_mask.height >> 1);

			var linesShift : Number = 36;
			_rightLinesPanel.y = _leftLinesPanel.y = -(_leftLinesPanel.height >> 1);
			_leftLinesPanel.x = _barabansBase.x - linesShift;

			_rightLinesPanel.x = _barabansBase.x + _barabansBase.width + linesShift;

			_chanesBottomLeft.x = -225;
			_chanesBottomLeft.y = 37;

			_chanesBottomRight.x = -_chanesBottomLeft.x;
			_chanesBottomRight.y = _chanesBottomLeft.y;

			_chanesTop1Left.x = _bg.x - 22;
			_chanesTop1Left.y = _bg.y - 32;

			_chanesTop1Right.x = -_chanesTop1Left.x;
			_chanesTop1Right.y = _chanesTop1Left.y;

			_chanesTop2Left.x = -177;
			_chanesTop2Left.y = -380;

			_chanesTop2Right.x = -_chanesTop2Left.x;
			_chanesTop2Right.y = _chanesTop2Left.y;
		}

		public function spin(newState : Array) : void
		{
			var durationBase : Number = 1;
			for (var i : int = 0; i < barabansNum; i++)
			{
				var baraban : Baraban = _baranans[i] as Baraban;
				var duration : Number = durationBase + 0.3 * i;
				baraban.spin(newState[i], duration);
			}
			
			(_baranans[_baranans.length - 1] as Baraban).addEventListener("AnimEnded", onAnimEnded);
			
		}

		private function onAnimEnded(e : Event) : void
		{
			//log("SlotMashine.onAnimEnded(e)");
			(e.target as IEventDispatcher).removeEventListener("AnimEnded", onAnimEnded);
			dispatchEvent(e);
		}

		public function drawLines(winLines : Array) : void
		{
			_linesBase.graphics.clear();

			//_linesBase.graphics.lineStyle(4, 0xFFFFFF * Math.random());
			// _linesBase.graphics.drawCircle(0, 0, 10);

			// var winLines : Array = [[[2, 3], [3, 5]]];

			var trans : Matrix = new Matrix();
			trans.identity();
			trans.translate(-3, -2);
			trans.scale(80, 84);

			var winLinesInBaseCoordSpace : Array = [];
			for each (var line : Array in winLines)
			{
				var linesInBaseCoordSpace : Array = line.map(function(item : Array, ..._) : Point
				{
					// Attention: coorditates are confused
					var point : Point = new Point(item[1], item[0]);
					point = trans.transformPoint(point);
					return point;
				});
				winLinesInBaseCoordSpace.push(linesInBaseCoordSpace);
			}

			// drawing
			for each (var lineInBaseCoordSpace : Array in winLinesInBaseCoordSpace)
			{
				_linesBase.graphics.lineStyle(4, 0xFFFFFF * Math.random());
				var firstPoint : Point = lineInBaseCoordSpace[0];
				_linesBase.graphics.moveTo(firstPoint.x, firstPoint.y);
				for (var i : int = 1; i < lineInBaseCoordSpace.length; i++)
				{
					var nextPoint : Point = lineInBaseCoordSpace[i];
					_linesBase.graphics.lineTo(nextPoint.x, nextPoint.y);
				}
			}
		}
	}
}
