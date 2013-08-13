package com.onlyplay.slotmatch3.components.games.match
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Quad;
	import com.greensock.easing.Sine;
	import com.onlyplay.slotmatch3.components.games.Util;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	/**
	 * @author Andrew
	 */
	public class Animations
	{
		//public static var gameAnimBase : DisplayObjectContainer;

		// public static var gamegameAnimBase:DisplayObjectContainer;
		public static function spiralVideo( animBase:DisplayObjectContainer, centerGlobal:Point) : void
		{
			if ( animBase ) 
			{
				var centerGameAnimBase : Point = centerGlobal;//animBase.globalToLocal(centerGlobal);

				var spir : Sprite = new spiral_();

				spir.width = animBase.stage.stageWidth;
				spir.height = animBase.stage.stageHeight;

				spir.width = 760;
				spir.height = 570;

				spir.x = centerGameAnimBase.x;
				// centerGlobal.x;
				spir.y = centerGameAnimBase.y;
				// centerGlobal.y;
				animBase.addChild(spir);
			}
			
			// if (gameAnimBase) gameAnimBase.removeChild(spir); 
			
		}

		public static function  spiralField(map : Dictionary, centerGlobal : Point, cellSize : Number, iconBase : DisplayObject, onComplete : Function = null) : void
		{
			// center - это координаты центра в коордитатах matchComponent'a.
			
			// spiralVideo(animBase, centerGlobal);

			var centerIconsParent : Point = iconBase.globalToLocal(centerGlobal);
			//
			// for each (var icon : DisplayObject in map) {
			// var iconBase:DisplayObjectContainer = icon.parent; 

			// centerIconsParent = icon 

			// }
			//

			iconBase.addEventListener(Event.ENTER_FRAME, onEnterFrame);

			//
			// This is pure improvisation and possible source of the memroy leaks

			var spiralStartTime : int = getTimer();

			var startPositionsMap : Dictionary = new Dictionary();

			for each (var icon : DisplayObject in map)
			{
				var key : Point = new Point(icon.x, icon.y);
				startPositionsMap[key] = icon;
			}

			var endTime : Number = 300;
			function onEnterFrame(e : Event) : void
			{
				// var transform:Transform

				var t : Number = getTimer() - spiralStartTime;
				// ага


				if (t >= endTime )
				{
					// reset state
					(e.target as IEventDispatcher).removeEventListener(Event.ENTER_FRAME, onEnterFrame);

					

					if (onComplete) 
					{
						TweenLite.delayedCall(0.4, onComplete);
					}

					// removing icons???
				}

				// var t:int = timer.currentCount;

				var newScate : Number = 1 - 0.8 * t / endTime;
				var newRotation : Number = 2 * Math.PI * t / endTime;

				var matrix : Matrix = new Matrix();

				matrix.translate(-centerIconsParent.x, -centerIconsParent.y);
				matrix.scale(newScate, newScate);
				matrix.rotate(newRotation);
				matrix.translate(centerIconsParent.x, centerIconsParent.y);

				for (var starpPoint : * in startPositionsMap)
				{
					// icon.transform.matrix = matrix;
					var icon : DisplayObject = startPositionsMap[starpPoint];
					var newPiont : Point = matrix.transformPoint(starpPoint);
					icon.x = newPiont.x;
					icon.y = newPiont.y;
					icon.scaleX = icon.scaleY = newScate;
				}
			}
		}




		public static function bangFromCenter(map : Dictionary, field : Array, cellSize : Number, center : Point) : void
		{
			var duration : Number = 0.25;
			var durationElastic : Number = 3;

			for (var itemId : String in map)
			{
				var icon : DisplayObject = map[itemId];
				var item : ItemModel = Matcher_v2.getItemById(itemId, field) as ItemModel;

				icon.x = center.x;
				icon.y = center.y;

				icon.scaleX = icon.scaleY = 0;

				var newX : Number = item.x * cellSize + (cellSize >> 1);
				var newY : Number = item.y * cellSize + (cellSize >> 1);
				var timeLine : TimelineLite = new TimelineLite();
				timeLine.appendMultiple([TweenLite.to(icon, duration, {x:newX, y:newY, ease:Linear.easeIn}), TweenLite.to(icon, duration, {scaleX:0.8, scaleY:0.8,// ease:Quint.easeIn
				// ease:Quint.easeOut 
				ease:Cubic.easeIn})]);

				timeLine.append(TweenLite.to(icon, durationElastic, {scaleX:1, scaleY:1, ease:Elastic.easeOut, easeParams:[1, 0.3]}));

				// 

			}
		}

		public static function fall(h : int, cellSize : Number, map : Dictionary) : void
		{
			log("Animations.fall(w, h, cellSize, map)");
			var delay : Number = 0;
			// var delayShift:Number = 0.1;
			var delta : Number = h * cellSize;
			// TODO: вынести в переменную

			var bounceHeight : Number = 8;

			var containerSprites : Array = [];
			for each (var icon : DisplayObject in map)
			{
				containerSprites.push(icon);
			}

			var partition : Array = Util.partition(containerSprites, function(item1 : Sprite, item2 : Sprite) : Boolean
			{
				return item1.x == item2.x;
			});

			partition.sort(function(group_1 : Array, group_2 : Array) : int
			{
				var y1 : int = group_1[0].x;
				var y2 : int = group_2[0].x;
				return  (y1 == y2) ? 0 : (y1 > y2) ? 1 : -1;
			}, Array.NUMERIC);

			var j : int = 0;
			for each (var group : Array in partition)
			{
				group.sortOn("y", Array.NUMERIC);
				delay = ++j * 0.15;

				for (var i : int = group.length - 1; i >= 0; i--)
				{
					var icon_ : Sprite = group[i] as Sprite;
					var endPosition : Number = icon_.y;
					icon_.y -= delta;

					var timeLine : TimelineLite = new TimelineLite();
					timeLine.delay = delay;
					timeLine.append(TweenLite.to(icon_, 0.25, {y:endPosition, ease:Linear.easeIn}));
					timeLine.append(TweenLite.to(icon_, 0.1, {y:endPosition - bounceHeight, ease:Sine.easeOut}));
					timeLine.append(TweenLite.to(icon_, 0.25, {y:endPosition, ease:Bounce.easeOut}));
					// TweenLite.from(icon_, 0.25, {y:icon_.y - delta, delay: delay });
					delay += 0.05;
				}
			}

			log(partition.length);

			// for (var i : int = 0; i < w; i++)
			// {
			// delay = i * 0.15;
			// for (var j : int = h - 1; j >= 0; j--)
			// {
			// var item : ItemModel = Matcher_v2.getItemByCoords(field, i, j) as ItemModel;
			// if (item)
			// {
			// var icon : DisplayObject = map[item.id];
			// var endPosition : Number = icon.y;
			// icon.y -= delta;
			// var timeLine : TimelineLite = new TimelineLite();
			// timeLine.delay = delay;
			// timeLine.append(TweenLite.to(icon, 0.25, {y:endPosition, ease:Linear.easeIn}));
			// timeLine.append(TweenLite.to(icon, 0.1, {y:endPosition - bounceHeight, ease:Sine.easeOut}));
			// timeLine.append(TweenLite.to(icon, 0.25, {y:endPosition, ease:Bounce.easeOut}));
			//						//  TweenLite.from(icon, 0.25, {y:icon.y - delta, delay: delay });
			// delay += 0.05;
			// }
			// }
			// }


			// -------------------------------------------------

			// for each (var item : ItemModel in sortedItems) 
			// {
			// var icon :DisplayObject = _map[item.id];
			// if (icon)
			// {
			// TweenLite.from(icon, 0.5, {y:icon.y - delta, delay: delay});
			// delay += 0.1;
			// }
			// }
		}

		public static function drop( field:Array, map:Dictionary,  h:int, w:int, cellSize:Number) : void
		{
						var delay : Number = 0;
			// var delayShift:Number = 0.1;
			var delta : Number = h * cellSize;
			// TODO: вынести в переменную

			for (var i : int = 0; i < w; i++)
			{
				delay = i * 0.05;
				for (var j : int = h - 1; j >= 0; j--)
				{
					var item : ItemModel = Matcher_v2.getItemByCoords( field, i, j) as ItemModel;
					if (item)
					{
						var icon : DisplayObject = map[item.id];
						if (icon)
						{
							// var endPosition : Number = icon.y;
							TweenLite.to(icon, 0.4, {y:icon.y + delta, ease:Quad.easeIn, delay:delay});

							// icon.y -= delta;
							// var timeLine:TimelineLite = new TimelineLite();
							// timeLine.delay = delay;
							// timeLine.append(TweenLite.to (icon, 0.25, {y:endPosition, ease:Linear.easeIn}));
							// timeLine.append(TweenLite.to(icon, 0.1, {y:endPosition - bounceHeight, ease:Sine.easeOut}));
							// timeLine.append( TweenLite.to(icon, 0.25, {y:endPosition, ease:Bounce.easeOut}));
							//						//  TweenLite.from(icon, 0.25, {y:icon.y - delta, delay: delay });
							delay += 0.03;
						}
					}
				}
			}
		}
	}
}
