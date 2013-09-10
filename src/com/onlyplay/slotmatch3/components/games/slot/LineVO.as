package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.geom.Point;
	/**
	 * @author Andrew
	 */
	public class LineVO
	{
		// TODO: подумать о введении IconVO
		public var points:Array;
		public var iconsCount:int;
		public var lineId:int;
		public var multiplyer:int;
		public var color:uint;
		public var winIconsTypes:Array;
		
		public function clone():LineVO
		{
			var l:LineVO = new LineVO();
			//l.points =  ;
			l.iconsCount = iconsCount;
			l.lineId = lineId;
			l.multiplyer = multiplyer;
			l.color = color;
			return l;
		}
		
		public static function calcWinTypes(points:Array, icons : Array) : Array
		{
			var types:Array = [];
			for each (var p : Point in points) {
				var type :int = icons[p.y][p.x];
				types.push( type );
			}
			return types;
		}
		
	}
}
