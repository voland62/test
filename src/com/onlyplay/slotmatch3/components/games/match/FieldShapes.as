package com.onlyplay.slotmatch3.components.games.match
{
	import flash.display.JointStyle;
	/**
	 * @author Andrew
	 */
	public class FieldShapes
	{
		public static const RECTANGULAR : int = 1;
		public static const SMILE:int = 2;

		public static function getFieldPattern(fieldShape : int, options : Array) : Array
		{
			var pattern : Array = [];
			switch(fieldShape)
			{
				case RECTANGULAR:
					var w : int = options[0];
					var h : int = options[1];
					for (var i : int = 0; i < w; i++)
					{
						for (var j : int = 0; j < h; j++)
						{
							//pattern.push([i, j]);
							pattern.push({x:i, y:j});
						}
					}
					break;
				case SMILE:
					pattern = smilePattern2;
				default: log("unknown field pattern");
			}

			return pattern;
		}
		

		
//		private static var smilePattern:Array =
//		[
//				    [2,0],[3,0],[4,0],
//			  [1,1],[2,1],[3,1],[4,1],[5,1],
//		[0,2],[1,2]		 ,[3,2],	  [5,2],[6,2],
//		[0,3],[1,3],[2,3],[3,3],[4,3],[5,3],[6,3],
//		[0,4],[1,4],[2,4],[3,4],[4,4],[5,4],[6,4],
//			  [1,5],[2,5],[3,5],[4,5],[5,5],
//				    [2,6],[3,6],[4,6]
//		
//		];
		
		private static var smilePattern2:Array =
		[
				            {x:2,y:0},{x:3,y:0},{x:4,y:0},
			      {x:1,y:1},{x:2,y:1},{x:3,y:1},{x:4,y:1},{x:5,y:1},
		{x:0,y:2},{x:1,y:2}		     ,{x:3,y:2},		  {x:5,y:2},{x:6,y:2},
		{x:0,y:3},{x:1,y:3},{x:2,y:3},{x:3,y:3},{x:4,y:3},{x:5,y:3},{x:6,y:3},
		{x:0,y:4},{x:1,y:4},{x:2,y:4},{x:3,y:4},{x:4,y:4},{x:5,y:4},{x:6,y:4},
			      {x:1,y:5},{x:2,y:5},{x:3,y:5},{x:4,y:5},{x:5,y:5},
				            {x:2,y:6},{x:3,y:6},{x:4,y:6}
		];
		
		
		
	}
}
