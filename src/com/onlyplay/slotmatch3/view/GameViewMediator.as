package com.onlyplay.slotmatch3.view
{
	import com.onlyplay.slotmatch3.model.MatchGameModel;

	import mx.events.DynamicEvent;

	import com.onlyplay.slotmatch3.model.GameModel;

	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.Mediator;

	/**
	 * @author Design3d
	 */
	public class GameViewMediator extends Mediator
	{
		[Inject]
		public var view : IGameView;
		[Inject]
		public var gameModel : GameModel;
		[Inject]
		public var matchGameModel : MatchGameModel;

		override public function initialize() : void
		{
			// log("---SlotsViewMediator.initialize()");
			addViewListener("spin", onSpin);
			addViewListener("inc", onInc);
			addViewListener("dec", onDec);
			addViewListener("AnimEnded", onAnimEnded);
			addViewListener("lines_dec", onLinesDec);
			addViewListener("lines_inc", onLinesInc);
			addViewListener("max_bet", onMaxBet);
			addViewListener("toSlot", onToSlot);
			addViewListener("toMatch", onToMatch);
			addViewListener("onBonus", onBonus);
			addViewListener("onPhoto", onPhoto);

			addContextListener("ready", onReady);
			addContextListener("showSpin", showSpin);
			addContextListener("showMatch", showMatch);
			addContextListener("locationChaged", onLocationChaged);
			
			addContextListener("userDataUpdated", onUserData);
			addContextListener("currenBetUpdated", onCurrentBetUpdated);
			// addContextListener("serverConfigUpdated", onServerConfigUpdate);
			addContextListener("currentMoneyChanged", onCurrentMoneyChanged);
			addContextListener("onPlayerUpdated", onPlayerUpdated);
			addContextListener("playersListUpdated", onPlayersListUpdated);
			// locationChaged
			//addContextListener("updateMyProgress", onUpdateMyProgress);
			//addContextListener("currentExperienceChanged", onExperienceChanged);
			addContextListener("matchTimerTick", onMatchCurrenTimeTick);
		}

		private function onLocationChaged( e:Event) : void
		{
			// stars
			
			var newStarProgress:Number;
			var q1:QuestProtobuf = gameModel.currentLocation.star1quest;
			var q2:QuestProtobuf = gameModel.currentLocation.star2quest;
			var q3:QuestProtobuf = gameModel.currentLocation.star3quest;
			
			
		}

		private function onPhoto(e : Event) : void
		{
		}

		private function onBonus(e : DynamicEvent) : void
		{
			eventDispatcher.dispatchEvent(e);
		}

		private function onMatchCurrenTimeTick(e : Event) : void
		{
			view.setMatchCurrentTime(matchGameModel.currentTime);
		}

		private function onToMatch(e : Event) : void
		{
			//dispatch(e);
			showMatch( null );
			// dispatch(new Event("playMatch"));
		}

		private function onToSlot(e : Event) : void
		{
			view.setSlotState();
		}

//		private function onExperienceChanged(e : Event) : void
//		{
//			view.setExperinece(gameModel.currentExperience.experience, gameModel.currentExperience.level, gameModel.currentExperience.leftVal, gameModel.currentExperience.rightVal);
//		}
//
//		private function onUpdateMyProgress(e : Event) : void
//		{
//			view.setProgress(gameModel.lastProgress, gameModel.targetProgress);
//		}

		// TODO: звести на модели соответствующий массив и заполнять только его по приходу плеердата
		private function makeCorrections(players : Array) : void
		{
			// for each (var player : ServerRoomPlayerStateProtobuf in players)
			// {
			// player.targetProgress = gameModel.targetProgress;
			// player.currentLevel = gameModel.getExperienceStuff(player.playerInfo.experience).level;
			// }
		}

		private function onPlayersListUpdated(e : Event) : void
		{
			// corrections
			makeCorrections(gameModel.players);
			view.setPlayers(gameModel.players);
		}

		private function onPlayerUpdated(e : DynamicEvent) : void
		{
			e.newPlayerState.targetProgress = gameModel.targetProgress;
			e.newPlayerState.currentLevel = gameModel.currentExperience.level;
			view.updatePlayerFromList(e.index, e.newPlayerState);
		}

		private function onCurrentMoneyChanged(e : Event) : void
		{
			view.setCurrenMoney(gameModel.currentMoney);
		}

		private function onMaxBet(e : DynamicEvent) : void
		{
			eventDispatcher.dispatchEvent(e);
		}

		private function onDec(e : DynamicEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("betPerLineChanged");
			event.delta = -1;
			eventDispatcher.dispatchEvent(event);
		}

		private function onInc(e : DynamicEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("betPerLineChanged");
			event.delta = 1;
			eventDispatcher.dispatchEvent(event);
		}

		private function onLinesInc(e : DynamicEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("lineNumChanged");
			event.delta = 1;
			eventDispatcher.dispatchEvent(event);
		}

		private function onLinesDec(e : DynamicEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("lineNumChanged");
			event.delta = -1;
			eventDispatcher.dispatchEvent(event);
		}

		private function onCurrentBetUpdated(e : Event) : void
		{
			view.setUpperBet(gameModel.currentBet.getWholeBet());
			view.setBetPerLine(gameModel.currentBet.betPerLine);
			view.setLines(gameModel.currentBet.linesNum);
		}

		private function onServerConfigUpdate(e : Event) : void
		{
			log("GameViewMediator.onServerConfigUpdate(e):" + "TODO");
			// view.updateConfig(gameModel.serverConfig);
		}

		private function onUserData(e : Event) : void
		{
			log("GameViewMediator.onUserData(e)");
			view.setName(gameModel.userInfo.name);
			view.setExperinece(gameModel.currentExperience.experience, gameModel.currentExperience.level, gameModel.currentExperience.leftVal, gameModel.currentExperience.rightVal);
			view.setMoney(gameModel.currentMoney);
		}

		private function onAnimEnded(e : Event) : void
		{
			view.setReady();
			
			var wasWin:Boolean = true;
			var win :Number = 10;
			if (wasWin)
			{
				view.playWinAnimation (win , onWinAnimComeplete);// или подписаться
			}
			
		}
		
		
		private function onWinAnimComeplete():void
		{
			dispatch(new Event("requestRoomProgress"));
		}

		private function onReady(e : Event) : void
		{
			view.setProgress(gameModel.lastProgress, gameModel.targetProgress);
			view.setMoney(gameModel.currentMoney);

			// makeCorrections(gameModel.players);
			// view.setPlayers(gameModel.players);

			view.setReady();
		}

		private function showSpin(e : Event = null) : void
		{
			view.setWin(gameModel.win);
			view.showSping(gameModel.icons);
			// view.drawLines(gameModel.winLines);
		}

		private function onSpin(e : Event = null) : void
		{
			dispatch(e);
		}

		private function showMatch(e : Event) : void
		{
			view.setMatchState();
			view.matchReinit();
		}
	}
}
