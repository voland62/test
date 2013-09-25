package com.onlyplay.slotmatch3.model
{
	import flash.utils.Dictionary;
	/**
	 * @author Andrew
	 */
	public class MatchGameModel
	{
		
		public static const FLASH_ENERGY_NORM:int = 1;
		public static const FLASH_ENERGY_FREEZE:int = 2;
		public static const FLASH_ENERGY_FULL:int = 3;
		
		public var maxTime:Number = 30;
		public var currentTime : Number;
		public var startTime : Number;
		public var matchModelProto : MatchProtobuf;
		public var boosters : Dictionary = new Dictionary();
		
		public var currentBoostersCharge:Number = 0;
		public var currentFlashEnergy : Number = 0;
		public var currentLevel : MatchLevelProtobuf;
		public var flashEnergyState:int;
		
		
	}
}
