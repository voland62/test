package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class OnConfigCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		[Inject]
		public var event : ServiceEvent;

		override public function execute() : void
		{
			log("OnConfigCommand.execute()");
			var message : ServerConfigProtobuf = event.message as ServerConfigProtobuf;
			log(message);
			//gameModel.serverConfig = message.locations[0];

			gameModel.serverConfig = getFirstLocation(message.locations);

			// TODO: consider doing this via models method? like GameModel.setCurrenBet(linesNum, betBerLine);
			gameModel.currentBet.linesNum = gameModel.serverConfig.maxLines;
			gameModel.currentBet.betPerLine = gameModel.serverConfig.minBet;

			eventDispatcher.dispatchEvent(new Event("currenBetUpdated"));
			eventDispatcher.dispatchEvent(new Event("serverConfigUpdated"));
		}

		private function getFirstLocation(locations : Array) : ServerLocationConfigProtobuf
		{
			for each (var location : ServerLocationConfigProtobuf in locations)
			{
				if (location.number == 1 && location.island == 1) return location;
			}
			return null;
		}
	}
}
