package com.onlyplay.slotmatch3.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.services.ServiceEvent;

	import mx.events.DynamicEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class OnRoomPlayerStateCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var e : ServiceEvent;
		[Inject]
		public var eventDispatcher : IEventDispatcher;

		override public function execute() : void
		{
			var newPlayerState : ServerRoomPlayerStateProtobuf = e.message as ServerRoomPlayerStateProtobuf;
			var oldPlayerState :ServerRoomPlayerStateProtobuf = getFromList(newPlayerState);
			
			if (gameModel.gameId == newPlayerState.playerInfo.gameId)
			{
				gameModel.lastProgress = newPlayerState.progress;
				
				// тут ещё вопрос надо ли обновлять currentExperience здесь 
				// или так так я в течении игры - после нажатия на спин 
				
				eventDispatcher.dispatchEvent(new Event("updateMyProgress"));
			}

			if (oldPlayerState)
			{
				var i :int = gameModel.players.indexOf(oldPlayerState);
				if (newPlayerState.isLeaving)
				{
					// deletion from the list
					//log("-------- deletion of player:" + newPlayerState.playerInfo.gameId);
					gameModel.players.splice(i,1);
					eventDispatcher.dispatchEvent(new Event("playersListUpdated"));
					
				}
				else
				{
					// update
					gameModel.players[i] = newPlayerState;
					var event:DynamicEvent = new DynamicEvent("onPlayerUpdated");
					event.index = i;
					event.newPlayerState = newPlayerState;
					eventDispatcher.dispatchEvent(event);
				}
			}
			else
			{
				if (!newPlayerState.isLeaving)
				{
					// adding to the list
					gameModel.players.push(newPlayerState);
					eventDispatcher.dispatchEvent(new Event("playersListUpdated"));
				}// else ignore
			}
		}

		private function getFromList(newPlayerState : ServerRoomPlayerStateProtobuf) : ServerRoomPlayerStateProtobuf
		{
			for each (var player : ServerRoomPlayerStateProtobuf in gameModel.players)
			{
				if ( player.playerInfo.gameId == newPlayerState.playerInfo.gameId)
				{
					return player;
				}
			}
			return null;
		}
	}
}
