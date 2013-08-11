package com.onlyplay.slotmatch3.model
{
	/**
	 * @author Design3d
	 */
	public class GameModel
	{
		// spin
		public var icons : Array;
		public var winLines : Array;
		
		// chat
		public var players : Array;
		
		
		public var targetProgress : int;
		public var lastProgress : int = 0;
		
		public var _ready : Boolean = false;
		public var gameId : int;
		public var currentIsland : IslandProtobuf;
		public var currentLocation :LocationProtobuf;
		public var currentBet : Bet = new Bet();
		public var currentMoney : int;
		public var win : Number = 0;
		public var levelsArray : Array = genLevels();
		public var currentExperience : Exp;
		
		//--- new model ----------------
		public var islands:IslandsProtobuf;
		public var userInfo : PlayerProtobuf;
		public var achievements:AchievementsProtobuf;
		
		

		private function genLevels() : Array
		{
			var levels : Array = [];
			var previousLevelExperience : int = 0;
			var currentLevelExperience : int = 0;
			for (var i : int = 0; i < 50; i++)
			{
				currentLevelExperience = previousLevelExperience + (i * 500);
				levels.push(currentLevelExperience);
				previousLevelExperience = currentLevelExperience;
			}
			
			//log(levels);
			
			return levels;
		}
		
		public function getExperienceStuff(experience:int):Exp
		{
			var exp:Exp = new Exp();
			exp.experience = experience;
			var lessThanMe :Array = levelsArray.filter(function (expLevel:int, ..._):Boolean { return expLevel <= experience;});
			exp.level = lessThanMe.length;
			exp.leftVal = experience - levelsArray[exp.level - 1];
			exp.rightVal = levelsArray[exp.level] - levelsArray[exp.level - 1];
			
			return exp;
		}
	}
}
