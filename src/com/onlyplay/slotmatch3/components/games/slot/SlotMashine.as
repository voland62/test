package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.display.MovieClip;

	import spark.primitives.Graphic;

	import com.greensock.TweenMax;

	import assets.AssetsStorage;

	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.VisiblePlugin;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.Dictionary;

	/**
	 * @author Design3d
	 */
	public class SlotMashine extends Sprite
	{
		[Embed(source="/assets/baraban/bg_lines.png", mimeType="image/png")]
		private static var LineBgClass : Class;
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
		private var _linesBase : DisplayObjectContainer = new Sprite();
		private var _winIconsBase : DisplayObjectContainer = new Sprite();
		private var _leftLineBg : Bitmap;
		private var _rightLineBg : Bitmap;
		private var iconsMap : Dictionary;
		private static const trans : Matrix = new Matrix();

		public function SlotMashine()
		{
			trans.identity();
			trans.translate(-3, -2);
			trans.scale(82, -84);

			TweenPlugin.activate([VisiblePlugin]);

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

			_leftLineBg = new LineBgClass();
			addChild(_leftLineBg);
			_rightLineBg = new LineBgClass();
			_rightLineBg.scaleX = -1;
			addChild(_rightLineBg);

			addChild(_linesBase);
			addChild(_winIconsBase);

			_leftLinesPanel = new LinesPanel();
			addChild(_leftLinesPanel);

			_rightLinesPanel = new LinesPanel(LinesPanel.RIGHT);
			addChild(_rightLinesPanel);

			var filter : DropShadowFilter = new DropShadowFilter();
			filter.inner = true;
			// filter.blurX = -1;
			// filter.blurY = -1;
			// filter.distance = 1;
			// _linesBase.filters = [filter];

			refresh();

			// drawLines([[[2, 3], [3, 5]]]);
		}

		public function init(d : Dictionary, newState : Array) : void
		{
			iconsMap = d;
			for (var i : int = 0; i < _baranans.length; i++) {
				var baraban:Baraban = _baranans[i];
				var barState:Array = newState[i];
				baraban.init(d, barState);
			}
//			for each (var baraban : Baraban in _baranans)
//			{
//				baraban.init(d, newState);
//			}
		}

		private function  refresh() : void
		{
			_bg.x = -(_bg.width >> 1) + 1;
			// коррекция на пискель
			// тут может быть поправка - зависящая от самого изображения
			_bg.y = -(_bg.height >> 1) - 5;
			_barabansBase.x = -(_barabansBase.width >> 1);
			_barabansBase.y = -(_barabansBase.height >> 1);

			_mask.x = -(_mask.width >> 1);
			_mask.y = -(_mask.height >> 1);

			var linesShift : Number = 36;
			_rightLinesPanel.y = _leftLinesPanel.y = -(_leftLinesPanel.height >> 1);
			_leftLinesPanel.x = _barabansBase.x - linesShift;
			_leftLineBg.x = _leftLineBg.x;
			_leftLineBg.x = _leftLinesPanel.x;
			_leftLineBg.y = _leftLinesPanel.y;

			_rightLinesPanel.x = _barabansBase.x + _barabansBase.width + linesShift;
			_rightLineBg.x = _rightLinesPanel.x;
			_rightLineBg.y = _rightLinesPanel.y;

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

		public function spin() : void
		{
			// var durationBase : Number = 1;
			for (var i : int = 0; i < barabansNum; i++)
			{
				var baraban : Baraban = _baranans[i] as Baraban;
				// var duration : Number = durationBase + 0.3 * i;
				// baraban.spin(newState[i], duration);
				baraban.spin(NaN);
			}

			// (_baranans[_baranans.length - 1] as Baraban).addEventListener("AnimEnded", onAnimEnded);
		}

		private function onAnimEnded(e : Event) : void
		{
			// log("SlotMashine.onAnimEnded(e)");
			(e.target as IEventDispatcher).removeEventListener("AnimEnded", onAnimEnded);
			dispatchEvent(e);
		}

		public function drawLines(winLines : Array) : void
		{
			// _linesBase.graphics.clear();
			_linesBase.removeChildren();
			_winIconsBase.removeChildren();
			// reset lines
			_leftLinesPanel.resetBages();
			_rightLinesPanel.resetBages();
			// hideLines();

			for each (var line : LineVO in winLines)
			{
				var lineInBaseCoordSpace : LineVO = line.clone();
				lineInBaseCoordSpace.points = line.points.map(function(point : Point, ..._) : Point
				{
					return trans.transformPoint(point);
				});
				drawLine(lineInBaseCoordSpace);
			}
		}

		private function drawLine(line : LineVO) : void
		{
			var thinkness : Number = 5;

			var color : int = line.color;
			// 0xFFFFFF * Math.random();
			var lin : Shape = new Shape();
			lin.name = line.lineId.toString();

			// filter
			var f : DropShadowFilter = new DropShadowFilter();
			f.inner = true;
			f.distance = -2;
			f.alpha = 0.8;
			lin.filters = [f];

			_linesBase.addChild(lin);
			lin.graphics.lineStyle(thinkness, color);

			var firstPoint : Point = line.points[0];
			lin.graphics.moveTo(firstPoint.x, firstPoint.y);
			for (var i : int = 1; i < line.points.length; i++)
			{
				var nextPoint : Point = line.points[i];
				lin.graphics.lineTo(nextPoint.x, nextPoint.y);
			}
			_leftLinesPanel.setBageStateById(line.lineId, true);
			_rightLinesPanel.setBageStateById(line.lineId, true);
			drawLastLine(line, lin.graphics);
		}

		private function drawLastLine(lineInBaseCoordSpace : LineVO, g : Graphics) : void
		{
			// finding BageCoord
			var bageCoords : Point = _leftLinesPanel.getBageCoordsById(lineInBaseCoordSpace.lineId);
			bageCoords ||= _rightLinesPanel.getBageCoordsById(lineInBaseCoordSpace.lineId);
			bageCoords = _linesBase.globalToLocal(bageCoords);
			var canditate1 : Point = lineInBaseCoordSpace.points[0];
			var canditate2 : Point = lineInBaseCoordSpace.points[lineInBaseCoordSpace.points.length - 1];
			var d1 : Number = Point.distance(canditate1, bageCoords);
			var d2 : Number = Point.distance(canditate2, bageCoords);

			var p : Point = (d1 < d2) ? canditate1 : canditate2;

			g.moveTo(p.x, p.y);
			g.lineTo(bageCoords.x, bageCoords.y);
		}

		// public var _ttt:DisplayObject;
		private var _winTimeLine : TimelineMax;

		public function playWinLinesAnim(winLines : Array) : void
		{
			_winTimeLine = new TimelineMax({repeat:-1});
			_linesBase.removeChildren();
			_winIconsBase.removeChildren();
			_leftLinesPanel.resetBages();
			_rightLinesPanel.resetBages();

			drawLines(winLines);
			drawWinIcons2(winLines);

			for each (var line_ : LineVO in winLines)
			{
				_linesBase.getChildByName(line_.lineId.toString()).visible = false;
			}
			var visInterval : Number = 0.3;
			var invisInterval : Number = 0.2;

			for each (var line : LineVO in winLines)
			{
				var lin : DisplayObject = _linesBase.getChildByName(line.lineId.toString());
				// var lin : DisplayObject =  _linesBase.getChildAt(i);
				_winTimeLine.append(new TweenLite(lin, visInterval, {visible:true}));
				_winTimeLine.append(new TweenLite(lin, invisInterval, {visible:false}));
				_winTimeLine.append(new TweenLite(lin, visInterval, {visible:true}));
				_winTimeLine.append(new TweenLite(lin, invisInterval, {visible:false}));
				_winTimeLine.append(new TweenLite(lin, visInterval, {visible:true}));
				// timeLine.append(new TweenLite(lin, invisInterval, {visible:false}));

				var iconsBase : DisplayObject = _winIconsBase.getChildByName(line.lineId.toString());
				_winTimeLine.append(TweenLite.delayedCall(0, foo3(iconsBase)));
				_winTimeLine.append(TweenLite.delayedCall(4, foo(iconsBase)));
				_winTimeLine.append(TweenLite.delayedCall(0, foo(lin)));
				// iconsBase.visible = true;
				// timeLine.append(new TweenMax(iconsBase, 3, {visible:true, onComplete:foo( iconsBase )}));
				
				
				
				function foo(ref : DisplayObject) : Function
				{
					return	function() : void
					{
						ref.visible = false;
					};
				}
				function foo2(ref : DisplayObject) : Function
				{
					return	function() : void
					{
						ref.alpha = 0;
					};
				}
				function foo3(ref : DisplayObject) : Function
				{
					return	function() : void
					{
						ref.visible = true;
					};
				}

				// iconsBase.visible = true;
				// if (iconsBase)
				// {
				// iconsBase.visible = true;
				// trace('iconsBase.name: ' + (iconsBase.name));
				// timeLine.append( TweenLite.delayedCall(0, function ():void{ iconsBase.visible = true ;}));
				// timeLine.append(new TweenLite(iconsBase, 1, {visible:true, onComplete:
				// function():void{ iconsBase.visible = false;
				// log("-cool");}}));
				// }
				//
				//				//  var icons:Array = getIconsbyLine( line );
				
				// for each (var ic : DisplayObject in icons) 
				// {
// timeLine.append(new TweenLite( ic, 0, {visible:true, onComplete:function(){ ic.visible = false; }}));
//					//  timeLine.append(new TweenLite( ic, 2, {visible:true}));
// }
				
				// здесь показ иконок
			}
		}

		// private function getIconsbyLine(line : LineVO) : Array
		// {
		// var icons : Array = [];
		// for (var i : int = 0; i < line.iconsCount; i++)
		// {
		// var name : String = line.lineId + "_" + i;
		// icons.push(_winIconsBase.getChildByName(name));
		// }
		// return icons;
		// }
		//
		// private function drawWinIcons(winLines : Array) : void
		// {
		// for each (var line : LineVO in winLines)
		// {
		// line.iconsCount;
		// line.winIconsTypes;
		// line.points;
		//
		// for (var i : int = 0; i < line.iconsCount; i++)
		// {
		// var p : Point = trans.transformPoint(line.points[i] as Point);
		// var winIc : Sprite = new winIcon();
		//					//
		//					//  winIc.width = winIc.height = 84;
		// winIc.x = p.x;
		// winIc.y = p.y;
		// _winIconsBase.addChild(winIc);
		//
		// log(iconsMap[line.winIconsTypes[i]]);
		//
		// AssetsStorage.instance.getAsset(iconsMap[line.winIconsTypes[i]], function(bm : BitmapData) : void
		// {
		// var ic : Bitmap = new Bitmap(bm);
		// ic.smoothing = true;
		// ic.width = ic.height = 70;
		// ic.x -= ic.width >> 1;
		// ic.y -= ic.height >> 1;
		// winIc.addChild(ic);
		// });
		// }
		// }
		// }
		private function drawWinIcons2(winLines : Array) : void
		{
			// здесь тип иконки спросить у барабана
			for each (var line : LineVO in winLines)
			{
				var iconsBase : Sprite = new Sprite();
				iconsBase.name = line.lineId.toString();
				// trace('++iconsBase.name: ' + (iconsBase.name));
				_winIconsBase.addChild(iconsBase);
				iconsBase.visible = false;

				for (var i : int = 0; i < line.iconsCount; i++)
				{
					var place : Point = line.points[i] as Point;
					var barabanNum : int = place.x - 1;
					var baraban : Baraban = _baranans[ barabanNum ];
					var iconAsset : BitmapData = baraban.getIconAsset(place.y);

					if (iconAsset)
					{
						var p : Point = trans.transformPoint(line.points[i] as Point);
						var winIc : Sprite = new Sprite();
						// = new winIcon();
						winIc.name = line.lineId + "_" + i;

						var bg : Sprite = new Sprite();
						var g : Graphics = bg.graphics;
						g.beginFill(line.color);
						g.drawRoundRect(0, 0, 80, 80, 8);
						g.endFill();
						bg.x -= bg.width >> 1;
						bg.y -= bg.height >> 1;

						winIc.addChild(bg);

						var litning : MovieClip = new litning_();
						bg.addChild(litning);
						litning.x = 40;
						// bg.width>>1;
						litning.y = 40;
						// bg.height>>1;

						var mask : Shape = new Shape();
						var g : Graphics = mask.graphics;
						g.beginFill(0);
						g.drawRoundRect(0, 0, 80, 80, 8);
						g.endFill();
						mask.x -= mask.width >> 1;
						mask.y -= mask.height >> 1;
						winIc.addChild(mask);
						bg.mask = mask;

						var cap : Shape = new Shape();
						var g : Graphics = cap.graphics;
						g.beginFill(0xFFFFFF);
						g.drawRoundRect(0, 0, 70, 70, 6);
						g.endFill();
						cap.x -= cap.width >> 1;
						cap.y -= cap.height >> 1;
						winIc.addChild(cap);

						//
						// winIc.width = winIc.height = 84;
						winIc.x = p.x;
						winIc.y = p.y;
						iconsBase.addChild(winIc);

						var ic : Bitmap = new Bitmap(iconAsset);
						ic.smoothing = true;
						ic.width = ic.height = 80;
						ic.x -= ic.width >> 1;
						ic.y -= ic.height >> 1;
						winIc.addChild(ic);
					}
				}
			}
		}

		public function hideLines() : void
		{
			_linesBase.removeChildren();
			_winIconsBase.removeChildren();
			_leftLinesPanel.resetBages();
			_rightLinesPanel.resetBages();

			if ( _winTimeLine )
			{
				_winTimeLine.kill();
				_winTimeLine.clear();
				_winTimeLine = null;
			}
		}

		public function stopRequest(newState : Array) : void
		{
			for (var i : int = 0; i < barabansNum; i++)
			{
				var baraban : Baraban = _baranans[i] as Baraban;
				// var duration : Number = durationBase + 0.3 * i;
				// baraban.spin(newState[i], duration);
				baraban.stopRequest(newState[i]);
			}

			(_baranans[_baranans.length - 1] as Baraban).addEventListener("AnimEnded", onAnimEnded);
		}
	}
}
