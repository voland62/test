package test.MyTestProject.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.BoosterVO;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class TestOnLoginCommand extends Command
	{
		[Inject]
		public var service : ISlotService;
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var matchModel : MatchGameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnLoginCommand.execute()");

			var message : LoginResponseProtobuf = event.message as LoginResponseProtobuf;
			log(message.toString());
			gameModel.gameId = message.gameId;
			// log('gameModel.gameId: ' + (gameModel.gameId));

			// gameModel._ready = true;
			gameModel.userInfo = message.player;
			gameModel.islands = message.islands;
			gameModel.achievements = message.achievements;
			gameModel.amulets = message.amulets;

			gameModel.currentIsland = getCurrentIsland(message.islands, message.player.currentIslandId);
			gameModel.currentLocation = getCurrentLocation(gameModel.currentIsland.locations, message.player.currentLocationId);

			// gameModel.currentBet.linesNum = gameModel.currentLocation.maxLinesAmount;
			gameModel.currentBet.lines = gameModel.getLines(gameModel.currentLocation.maxLinesAmount);
			gameModel.currentBet.betPerLine = gameModel.currentLocation.minBet;

			// gameModel.currentExperience = gameModel.getExperienceStuff(message.player.experience);
			gameModel.currentExperience.leftVal = message.player.experience;
			gameModel.currentExperience.rightVal = message.player.experienceBound;
			gameModel.currentExperience.level = message.player.level;

			// boosters
			var maxes : Array = [null, 150, 150, 150, 150];
			for each (var boost : BoosterProtobuf in message.player.boosters.boosters)
			{
				var b : BoosterVO = matchModel.boosters[boost.boosterId] || new BoosterVO();

				b.amount = boost.amount;
				b.boosterId = boost.boosterId;
				b.maxEnergy = maxes[ boost.boosterId ];

				matchModel.boosters[ boost.boosterId ] = b;
			}

			// matchModel.boosters = message.player.boosters.boosters;

			eventDispatcher.dispatchEvent(new Event("locationChaged"));

			var ev : DynamicEvent = new DynamicEvent("currenBetUpdated");
			ev.showLines = false;
			eventDispatcher.dispatchEvent(ev);
			eventDispatcher.dispatchEvent(new Event("userDataUpdated"));

			var lobbyEvt : DynamicEvent = new DynamicEvent("islandsDataReady");
			lobbyEvt.data = gameModel.islands;
			eventDispatcher.dispatchEvent(lobbyEvt);

			// gameModel.serverConfig = getFirstLocation(message.locations);

			// TODO: consider doing this via models method? like GameModel.setCurrenBet(linesNum, betBerLine);

			// eventDispatcher.dispatchEvent(new Event("ready"));
			// eventDispatcher.dispatchEvent(new Event("currenBetUpdated"));
			// eventDispatcher.dispatchEvent(new Event("serverConfigUpdated"));

			// service.getUserData( gameModel.gameId );

			service.enterLocation(gameModel.currentIsland.islandId, gameModel.currentLocation.locationId);

			// service.enterRoom();
		}

		private function getCurrentLocation(locations : Array, locationId : int) : LocationProtobuf
		{
			for each (var location : LocationProtobuf in locations)
			{
				if (location.locationId == locationId) return location;
			}
			return null;
		}

		private function getCurrentIsland(islands : IslandsProtobuf, islandId : int) : IslandProtobuf
		{
			for each (var island : IslandProtobuf in islands.islands)
			{
				if (island.islandId == islandId)
				{
					return island;
				}
			}
			return null;
		}
	}
}
