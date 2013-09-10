package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.geom.Point;
	/**
	 * @author Design3d
	 */
	public class LinesData
	{
		
		public static const colors:Array = initColors();
				
		private static function initColors() : Array
		{
			var a : Array = [];
			addColor(0, 254, 255);
			addColor(0, 169, 255);
			addColor(66, 82, 255);
			addColor(186, 107, 255);
			addColor(135, 0, 238);
			addColor(255, 35, 232);
			addColor(255, 25, 86);
			addColor(255, 71, 25);
			addColor(255, 123, 0);
			addColor(32, 255, 85);
			addColor(255, 251, 30);
			addColor(140, 240, 0);
			addColor(0, 222, 129);
			addColor(91, 255, 213);
			addColor(255, 152, 241);
			addColor(199, 255, 0);
			addColor(81, 255, 137);
			addColor(220, 0, 255);
			addColor(219, 142, 255);
			addColor(169, 140, 255);
			addColor(255, 90, 95);
			addColor(189, 255, 82);
			addColor(255, 0, 0);
			addColor(200, 0, 70);
			addColor(255, 244, 96);
			addColor(0, 192, 0);
			addColor(17, 255, 0);
			addColor(0, 199, 86);
			addColor(255, 119, 197);
			addColor(255, 133, 43);
			addColor(142, 255, 123);
			addColor(0, 188, 189);
			addColor(71, 106, 255);
			addColor(171, 19, 181);
			addColor(123, 107, 245);
			addColor(255, 76, 152);
			addColor(133, 214, 255);
			addColor(78, 255, 78);
			addColor(230, 0, 132);
			addColor(255, 108, 227);

			return a;

			function addColor(r : int, g : int, b : int) : void
			{
				var col : uint = (r << 16) + (g << 8) + b;
				a.push(col);
			}
		}
		
		public static const lines:Array = 
		[
			[[2,1], [2,2], [2,3], [2,4], [2,5]],
			[[1,1], [1,2], [1,3], [1,4], [1,5]],
			[[3,1], [3,2], [3,3], [3,4], [3,5]],
			[[1,1], [2,2], [3,3], [2,4], [1,5]],
			[[3,1], [2,2], [1,3], [2,4], [3,5]],
			
			[[2,1], [1,2], [1,3], [1,4], [2,5]],
			[[2,1], [3,2], [3,3], [3,4], [2,5]],
			[[1,1], [1,2], [2,3], [3,4], [3,5]],
			[[3,1], [3,2], [2,3], [1,4], [1,5]],
			[[2,1], [3,2], [2,3], [1,4], [2,5]],
			
			[[2,1], [1,2], [2,3], [3,4], [2,5]],
			[[1,1], [2,2], [2,3], [2,4], [1,5]],
			[[3,1], [2,2], [2,3], [2,4], [3,5]],
			[[1,1], [2,2], [1,3], [2,4], [1,5]],
			[[3,1], [2,2], [3,3], [2,4], [3,5]],
			
			[[2,1], [2,2], [1,3], [2,4], [2,5]],
			[[2,1], [2,2], [3,3], [2,4], [2,5]],
			[[1,1], [1,2], [3,3], [1,4], [1,5]],
			[[3,1], [3,2], [1,3], [3,4], [3,5]],
			[[1,1], [3,2], [3,3], [3,4], [1,5]],
			
			[[3,1], [1,2], [1,3], [1,4], [3,5]],
			[[2,1], [3,2], [1,3], [3,4], [2,5]],
			[[2,1], [1,2], [3,3], [1,4], [2,5]],
			[[1,1], [3,2], [1,3], [3,4], [1,5]],
			[[3,1], [1,2], [3,3], [1,4], [3,5]],
			
			[[3,1], [1,2], [2,3], [3,4], [1,5]],
			[[1,1], [3,2], [2,3], [1,4], [3,5]],
			[[1,1], [3,2], [2,3], [3,4], [1,5]],
			[[3,1], [1,2], [2,3], [1,4], [3,5]],
			[[3,1], [2,2], [1,3], [1,4], [2,5]],
			
			[[1,1], [2,2], [3,3], [3,4], [2,5]],
			[[1,1], [1,2], [3,3], [3,4], [3,5]],
			[[3,1], [3,2], [1,3], [1,4], [1,5]],
			[[2,1], [1,2], [3,3], [2,4], [3,5]],
			[[2,1], [3,2], [1,3], [2,4], [1,5]],
			
			[[1,1], [2,2], [1,3], [2,4], [3,5]],
			[[3,1], [2,2], [3,3], [2,4], [1,5]],
			[[2,1], [3,2], [3,3], [1,4], [1,5]],
			[[1,1], [1,2], [2,3], [2,4], [3,5]],
			[[3,1], [3,2], [2,3], [2,4], [1,5]]
		];
		
		public static function getLinePointsById( id:int ):Array
		{
			var points:Array = lines[id];//lines[id - 1];
			if (points)
			{
			  return points.map(function(point : Array, ..._) : Point
				{
					return new Point( point[1], point[0]);
				});
			}
			else return null;
		}
		
		public static function getColorById(id:int):uint
		{
			return colors[ id ];
		}
	}
}
