package com.onlyplay.slotmatch3.components.games.match
{
	/**
	 * @author Andrew
	 */
	public class ItemModel
	{
		public static const HOURGLASS :int = 1;
		public static const COIN:int = 2;
		public static const FLASH:int = 3;
		
		public static const HOR:int = 1;
		public static const VER:int = 2;
		public static const BOMB:int = 3;
		
		public static const CHAIN:Boolean = true;
		
		
		public var x:int;
		public var y:int;
		public var type:int;
		public var id:String;
				
		public var microbonus:int;
		public var charge:int;
		public var chain : Boolean ;

		public function ItemModel(x:int = 0, y:int = 0, type:int = 0, id:String = "")
		{
			this.x = x;
			this.y = y;
			this.type = type;
			this.id = id;
		}
		
		public function clone():ItemModel
		{
			var i:ItemModel = new ItemModel(x, y, type, id);
			i.microbonus = microbonus;
			i.charge = charge;
			i.chain = chain;
			return i;
		}

		
	}
}
