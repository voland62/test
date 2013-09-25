package com.onlyplay.slotmatch3.model
{
	import com.onlyplay.slotmatch3.components.games.slot.LinesData;
	import com.onlyplay.slotmatch3.components.games.slot.LineVO;
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
		private var _gameId : int;
		public var currentIsland : IslandProtobuf;
		public var currentLocation :LocationProtobuf;
		public var currentBet : Bet = new Bet();
		public var currentMoney : int;
		public var win : Number = 0;
		public var levelsArray : Array = genLevels();
		public var currentExperience : Exp = new Exp();
		
		//--- new model ----------------
		public var islands:IslandsProtobuf;
		public var userInfo : PlayerProtobuf;
		public var achievements : AchievementsProtobuf;
		public var multipliers : Array;
		
		
		

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

		public function get gameId() : int
		{
			return _gameId;
		}

		public function set gameId(newGameId : int) : void 
		{
			_gameId = newGameId;
		}

		public function getLines(maxLinesAmount : int) : Array
		{
			// TODO: потом, возможно вынести это во что-то утильное
			var lines :Array = [];
			for (var i : int = 0; i < maxLinesAmount; i++) 
			{
					var line :LineVO = new LineVO();
					line.lineId = i;
					line.color = LinesData.getColorById(i);
					line.points = LinesData.getLinePointsById(i);
					
					lines.push(line);
			}
			return lines;
		}
	}
}
