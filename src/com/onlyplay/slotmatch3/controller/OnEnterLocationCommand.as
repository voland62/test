package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.components.games.Util;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Andrew
	 */
	public class OnEnterLocationCommand extends Command
	{
		[Inject]
		public var event : ServiceEvent;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			log("OnEnterLocationCommand.enclosing_method(enclosing_method_arguments)");

			gameModel._ready = true;
			var message : LocationEnterResponseProtobuf = event.message as LocationEnterResponseProtobuf;
			// log(message);

			// addUrls( message.multipliers.multipliers );

			gameModel.multipliers = constructMultiplyers(message.multipliers.multipliers);
			gameModel.targetProgress = message.room.progress;
			// message.room.
			eventDispatcher.dispatchEvent(new Event("ready"));
			
			var ev : DynamicEvent = new DynamicEvent("state_changes");
			ev.state = "game";
			eventDispatcher.dispatchEvent(ev);
		}

		private function constructMultiplyers(multipliers : Array) : Array
		{
			var arr : Array = [];

			for each (var mult : IconMultiplierProtobuf in multipliers)
			{
				var m : Object = {x1:mult.x1, x2:mult.x2, x3:mult.x3, x4:mult.x4, x5:mult.x5};
				m.url = Util.getIconUrl(gameModel.currentIsland.islandId, gameModel.currentLocation.locationId, mult.iconId);
				m.localeKey = Util.getLocaleKey(gameModel.currentIsland.islandId, gameModel.currentLocation.locationId, mult.iconId);
				// log(m.url);
				arr.push(m);
			}

			return arr;
		}
	}
}
