package com.onlyplay.slotmatch3.components.games
{
	import flash.display.BitmapData;
	import assets.AssetsStorage;
	import com.onlyplay.slotmatch3.components.games.match.Matcher_v2;

	import flash.display.Graphics;
	import flash.geom.Point;

	/**
	 * @author Design3d
	 */
	public class Util
	{
		public static function randInt(n : int) : int
		{
			return int(Math.random() * n);
		}

		public static function randBool() : Boolean
		{
			return Math.random() > 0.5;
		}

		public static function sign(v : Number) : int
		{
			// return (v == 0) ? 0 : (v > 0) ? 1 : -1;
			return (v > 0) ? 1 : -1;
		}

		public static function mod_(a : Number, b : Number) : Number
		{
			return (a < 0) ? b + a % b : a % b;
		}

		public static function range(n : int) : Array
		{
			var res : Array = [];
			for (var i : int = 0; i < n; i++) res.push(i);
			return res;
		}

		public static function getTimeString(t : Number) : String
		{
			var secs : Number = t % 60;
			var min : Number = Math.floor(t / 60) % 60;
			// var hours :Number = Math.floor(t/3600) % 24;
			return  getDigit(min, 1).toString() + getDigit(min, 0) + ":" + getDigit(secs, 1) + getDigit(secs, 0);

			function getDigit(n : Number, p : uint) : uint
			{
				return uint((n % Math.pow(10, p + 1)) / Math.pow(10, p));
			}
		}

		public static function drawCircleSegment(graphics : Graphics, center : Point, start : Number, end : Number, r : Number, h_ratio : Number = 1, v_ratio : Number = 1, new_drawing : Boolean = true) : void
		{
			var x : Number = center.x;
			var y : Number = center.y;
			// first point of the circle segment
			graphics.moveTo(center.x, center.y);
			if (new_drawing)
			{
				graphics.lineTo(x + Math.cos(start) * r * h_ratio, y + Math.sin(start) * r * v_ratio);
			}

			// draw the circle in segments
			var segments : uint = 8;

			var theta : Number = (end - start) / segments;
			var angle : Number = start;
			// start drawing at angle ...

			var ctrlRadius : Number = r / Math.cos(theta / 2);
			// this gets the radius of the control point
			for (var i : int = 0; i < segments; i++)
			{
				// increment the angle
				angle += theta;
				var angleMid : Number = angle - (theta / 2);
				// calculate our control point
				var cx : Number = x + Math.cos(angleMid) * (ctrlRadius * h_ratio);
				var cy : Number = y + Math.sin(angleMid) * (ctrlRadius * v_ratio);
				// calculate our end point
				var px : Number = x + Math.cos(angle) * r * h_ratio;
				var py : Number = y + Math.sin(angle) * r * v_ratio;
				// draw the circle segment
				graphics.curveTo(cx, cy, px, py);
			}
		}

		public static function partition(container : Array, foo : Function) : Array
		{
			if (container.length == 0) return [];

			var el : Object = container[0];
			var group : Array = container.filter(function(item : Object, ..._) : Boolean
			{
				return foo(el, item);
			});
			var rest : Array = Matcher_v2.substruct(container, group);
			return partition(rest, foo).concat([group]);
		}

		public static function getIconUrl(islandId : int, locationId : int, iconId : int) : String
		{
			var islands : Array = [null, "hawaii", "underwater", "amazonka", "pirate"];
			// TODO: Взять из конфига
			//var urlBase : String = "D:/reps/slogmatch3_3/Resources/Slot/slot_icons/";
			var urlBase : String = "http://onlyplay.game-insight.com/puzzleslots/flash/slot_icons/";
			//var urlBase:String = "slot_icons/";
			var island : String = islands[ islandId ];
			// var location:String = locationId.toString();

			var name : String = "island" + islandId + "_location" + locationId + "_icon" + ++iconId + ".png";
			var folder : String = "icons_" + island + "_level_0" + locationId + "/";
			return urlBase + folder + name;
		}

		public static function getLocaleKey(islandId : int, locationId : int, iconId : int) : String
		{
			return "slot_icon_" + islandId + "_" + locationId + "_" + ++iconId + "_name";
		}
		
		public static function formLevelMultiplyerString ( multiplier :Number ):String
		{
			return (multiplier == int(multiplier)) ? multiplier.toString() : multiplier.toFixed(1);
		}

		public static function getK(n : int) : Number
		{
			if (n < 4)
			{
				return n;
			}
			else
			{
				return (((n - 1) * n) / 2) - (n - 3);
			}
		}

		public static function getAmuletUrl(type : int) : *
		{
			var urlBase:String = "D:/reps/slotmatch3_3/Resources/Amulets/";
			
			var res:String = urlBase + "amulet_" + type + ".png"; 
			//log( "----",  res );
			return res;
			
//			var bm:BitmapData;
//			
//			function foo( b:BitmapData ):void
//			{
//				bm = b;
//			}
//			
//			AssetsStorage.instance.getAsset( 'ach_3', foo);
//			return bm;
		}
	}
}
