package com.onlyplay.slotmatch3.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import com.onlyplay.slotmatch3.components.games.elements.FreezeProgress;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.view.dialogs.IPaymentsPopup;

	import mx.events.DynamicEvent;

	import flash.events.Event;

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
			addViewListener("flashEnergy", onFlashEnergy);
			addViewListener("showPaymentsDialog", onShowPaymentsDialog);
			addViewListener("game_view:to_map", toMap);
            addViewListener("onFace", onFace);
            addViewListener("uc", function (e:Event):void{ dispatch(new DynamicEvent("underConstruction"));});
			
			//addContextListener("toSlot", onToSlot);
			addContextListener( "showSlot" , showSlot);
			
			if ( gameModel._ready )
			{
				onReady( null );
			}else
			{
				addContextListener("ready", onReady);
			}
			
			addContextListener("state_changes", onStateChange);
			
			addContextListener("showSpin", showSpin);
			addContextListener("showMatch", showMatch);
			addContextListener("locationChaged", onLocationChaged);
			addContextListener("onRoomProgressChanged", onRoomProgressChanged);
			addContextListener("experienceChaged", onExperienceChaged);
			addContextListener("playersListUpdated", onPlayersListUpdated);
			addContextListener("boosterAmountChanged", onBoosterClick);
			// experienceChaged

			addContextListener("userDataUpdated", onUserData);
			addContextListener("currenBetUpdated", onCurrentBetUpdated);
			// addContextListener("serverConfigUpdated", onServerConfigUpdate);
			addContextListener("currentMoneyChanged", onCurrentMoneyChanged);
			addContextListener("currentFlashEnergyChanged", onCurrentFlashEnergyChanged);
			addContextListener("onPlayerUpdated", onPlayerUpdated);
			// locationChaged
			// addContextListener("updateMyProgress", onUpdateMyProgress);
			// addContextListener("currentExperienceChanged", onExperienceChanged);
			addContextListener("matchTimerTick", onMatchCurrenTimeTick);
			addContextListener("currentFlashEnergyChanged", onCurrentFlashEnergyChanged);
		}

		private function onStateChange( e:DynamicEvent ) : void
		{
			if (e.state == "game")
			{
				// Здесь мы рефрешим барабан при новом заходе
				view.initSlot( gameModel.currentIsland.islandId, gameModel.currentLocation.locationId );
			}
		}

		private function onFace( e:Event) : void
		{
			log("GameViewMediator.onFace(e)");
			var event:DynamicEvent = new DynamicEvent( "showProfile" );
			dispatch( event );
		}

		private function showSlot( e:Event ) : void
		{
			view.setSlotState();
		}

		private function onShowPaymentsDialog(e : Event) : void
		{
			var event:DynamicEvent = new DynamicEvent( e.type );
			event.interface_ = IPaymentsPopup;
			dispatch(event);
		}

		private function onFlashEnergy(e : DynamicEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("onFlashEnergyIncrease");
			event.val = e.val;
			dispatch(event);
		}

		private function onCurrentFlashEnergyChanged(e : Event) : void
		{
			var state : int;
			switch(matchGameModel.flashEnergyState)
			{
				case MatchGameModel.FLASH_ENERGY_NORM:
					state = FreezeProgress.NORMAL;
					break;
				case MatchGameModel.FLASH_ENERGY_FREEZE:
					state = FreezeProgress.FROZEN;
					break;
				case MatchGameModel.FLASH_ENERGY_FULL:
					state = FreezeProgress.LOCKED;
					break;
				default:
			}
			view.setMatchCurrentFlashEnergy(matchGameModel.currentFlashEnergy, matchGameModel.currentLevel.energy, matchGameModel.currentLevel.multiplier, state);
		}

		private function onBoosterClick(e : DynamicEvent) : void
		{
			view.playBooster(e.boosterType);
		}

		private function onExperienceChaged(e : Event) : void
		{
			view.setExperinece(gameModel.currentExperience.experience, gameModel.currentExperience.level, gameModel.currentExperience.leftVal, gameModel.currentExperience.rightVal);
		}

		private function onRoomProgressChanged(e : Event) : void
		{
			view.setProgress(gameModel.lastProgress, gameModel.targetProgress);
		}

		private function onLocationChaged(e : Event) : void
		{
			// stars

			var q1 : QuestProtobuf = gameModel.currentLocation.star1quest;
			var q2 : QuestProtobuf = gameModel.currentLocation.star2quest;
			var q3 : QuestProtobuf = gameModel.currentLocation.star3quest;

			var commonMax : Number = q1.completeValue + q2.completeValue;
			var commonCurrent : Number = q1.currentValue + q2.currentValue;

			var commonPercentage : Number = commonCurrent / commonMax;
			log('---commonPercentage: ' + (commonPercentage));
			view.setStarsProgress(commonPercentage);

			view.initSlot(gameModel.currentIsland.islandId, gameModel.currentLocation.locationId);
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
			view.hideLines();			
			dispatch(e);
			// showMatch( null );
			// dispatch(new Event("playMatch"));
		}

		private function onToSlot(e : Event) : void
		{
			var event :DynamicEvent = new DynamicEvent("showToSlotPopup");
			dispatch(event);
			//dispatch(e);
			//view.setSlotState();
		}

		//
		// private function onUpdateMyProgress(e : Event) : void
		// {
		// view.setProgress(gameModel.lastProgress, gameModel.targetProgress);
		// }
		// TODO: звести на модели соответствующий массив и заполнять только его по приходу плеердата
		private function makeCorrections(players : Array) : void
		{
			for each (var player : PlayerShortProtobuf in players)
			{
				player.targetProgress = gameModel.targetProgress;
				// player.currentLevel = gameModel.getExperienceStuff(player.playerInfo.experience).level;
			}
		}

		private function onPlayersListUpdated(e : Event) : void
		{
			// log("GameViewMediator.onPlayersListUpdated(e)");
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
			view.hideLines();
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

		private function onCurrentBetUpdated(e : DynamicEvent) : void
		{
			view.setUpperBet(gameModel.currentBet.getWholeBet());
			view.setBetPerLine(gameModel.currentBet.betPerLine);
			// var showLines:Boolean = e.hasOwnProperty("showLines") && e.showLines;
			view.setLines(gameModel.currentBet.lines, e.showLines);
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

			var wasWin : Boolean = true;
			var win : Number = gameModel.win;
			// 10;
			if ( win > 0 )
			{
				view.setWin(gameModel.win);
				view.playWinAnimation(win, gameModel.winLines, onWinAnimComeplete);
				// или подписаться
			}
		}

		private function onWinAnimComeplete() : void
		{
			dispatch(new Event("requestRoomProgress"));
		}

		private function onReady(e : Event) : void
		{
			view.setProgress(gameModel.lastProgress, gameModel.targetProgress);
			view.setMoney(gameModel.currentMoney);

			view.setMaxBet(gameModel.currentLocation.maxBet * gameModel.currentLocation.maxLinesAmount);

			// makeCorrections(gameModel.players);
			// view.setPlayers(gameModel.players);

			view.setReady();
		}

		private function showSpin(e : Event = null) : void
		{
			//view.setWin(gameModel.win);
			view.showSping(gameModel.icons);
			// view.drawLines(gameModel.winLines);
		}

		private function onSpin(e : Event = null) : void
		{
			dispatch(e);
			view.setPlayButtonState( false );
			view.hideLines();
		}

		private function showMatch(e : Event) : void
		{
			view.setMatchState();
			view.matchReinit(matchGameModel.matchModelProto.iconEnergy);
			view.initFlashEnergy(matchGameModel.currentLevel.multiplier);
		}
		
		private function toMap(e:DynamicEvent) :void{			
			/**
			 * Так как у нас смена стейта на лобби только после лиалога - то это сообщение буде диспатчить диалог после закрытия
			 */	
//			var event : DynamicEvent = new DynamicEvent("state_changes_request");
//			event.state = "lobby";
//			dispatch(event);
			
			// log("GameViewMediator.toMap(e)");
			
			var event:DynamicEvent = new DynamicEvent("showToMapMediator");
			dispatch(event);
			
		}
	}
}
