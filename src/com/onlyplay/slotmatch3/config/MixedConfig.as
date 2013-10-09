package com.onlyplay.slotmatch3.config
{
	import net.IConnector;
	import net.MessagesMap;
	import net.SocketConnector;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import test.MyTestProject.model.UserModel;

	import com.onlyplay.slotmatch3.components.dialogs.flex.ToSlotPopUp;
	import com.onlyplay.slotmatch3.components.dialogs.flex.info.InfoPopup;
	import com.onlyplay.slotmatch3.components.games.elements.booster.BoosterPanel;
	import com.onlyplay.slotmatch3.components.lobby_smith.IInterLevelDlg;
	import com.onlyplay.slotmatch3.components.lobby_smith.LevelInfoMediator;
	import com.onlyplay.slotmatch3.components.lobby_smith.LevelInfoPopup;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyCellItem;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyView;
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyViewMediator;
	import com.onlyplay.slotmatch3.components.lobby_smith.LocationBtn;
	import com.onlyplay.slotmatch3.components.lobby_smith.LocationInfoDlg;
	import com.onlyplay.slotmatch3.components.lobby_smith.Menu4View;
	import com.onlyplay.slotmatch3.controller.InitCommand;
	import com.onlyplay.slotmatch3.controller.MakeMatchEnterRequestCommand;
	import com.onlyplay.slotmatch3.controller.OnChageCommand;
	import com.onlyplay.slotmatch3.controller.OnEnterLocationCommand;
	import com.onlyplay.slotmatch3.controller.OnLoginCommand;
	import com.onlyplay.slotmatch3.controller.OnMatchEnterCommand;
	import com.onlyplay.slotmatch3.controller.OnMatchLeaveComand;
	import com.onlyplay.slotmatch3.controller.OnRoomChangeedCommand;
	import com.onlyplay.slotmatch3.controller.RequestRoomProgressCommand;
	import com.onlyplay.slotmatch3.controller.currentBetChanging.BetPerLineChangingCommand;
	import com.onlyplay.slotmatch3.controller.currentBetChanging.LineNumChangingCommand;
	import com.onlyplay.slotmatch3.controller.currentBetChanging.MaxBetCommand;
	import com.onlyplay.slotmatch3.controller.dialogs.ShowPopupCommand;
	import com.onlyplay.slotmatch3.controller.lobby.StateChangesCommand;
	import com.onlyplay.slotmatch3.controller.match.OnBonusCommand;
	import com.onlyplay.slotmatch3.controller.match.OnBoosterCommand;
	import com.onlyplay.slotmatch3.controller.match.OnFlashEnergyEncreaseCommand;
	import com.onlyplay.slotmatch3.controller.match.PlaySlotCommand;
	import com.onlyplay.slotmatch3.controller.match.TimeOverCommand;
	import com.onlyplay.slotmatch3.controller.spin.OnSpinCommand;
	import com.onlyplay.slotmatch3.controller.spin.SpinCommand;
	import com.onlyplay.slotmatch3.controller.spin.TryStopSpin;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.BoosterTimerService;
	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.MatchEnergyFallingService;
	import com.onlyplay.slotmatch3.services.MatchTimerService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;
	import com.onlyplay.slotmatch3.services.SlotService;
	import com.onlyplay.slotmatch3.view.ApplicationMediator;
	import com.onlyplay.slotmatch3.view.BoosterPanelMediator;
	import com.onlyplay.slotmatch3.view.GameViewMediator;
	import com.onlyplay.slotmatch3.view.IApp;
	import com.onlyplay.slotmatch3.view.IGameView;
	import com.onlyplay.slotmatch3.view.dialogs.IPaymentsPopup;
	import com.onlyplay.slotmatch3.view.dialogs.IProfilePopup;
	import com.onlyplay.slotmatch3.view.dialogs.ITimeOverPopup;
	import com.onlyplay.slotmatch3.view.dialogs.IToMap;
	import com.onlyplay.slotmatch3.view.dialogs.IToSlot;
	import com.onlyplay.slotmatch3.view.dialogs.InfoPopupMediator;
	import com.onlyplay.slotmatch3.view.dialogs.PaymentsPopupMediator;
	import com.onlyplay.slotmatch3.view.dialogs.ProfilePopupMediator;
	import com.onlyplay.slotmatch3.view.dialogs.TimeOverPopupMediator;

	import com.onlyplay.slotmatch3.components.lobby_smith.*;
	import com.onlyplay.slotmatch3.view.preloader.*;
	import com.onlyplay.slotmatch3.controller.lobby.StateChangesCommand
	import com.onlyplay.slotmatch3.components.lobby_user_info.*;

	import com.onlyplay.slotmatch3.view.dialogs.ToMapMediator;
	import com.onlyplay.slotmatch3.view.dialogs.ToSlotMediator;
	import com.onlyplay.slotmatch3.view.preloader.Preloader;
	import com.onlyplay.slotmatch3.view.preloader.PreloaderMediator;
	import com.onlyplay.slotmatch3.view.preloader.PreloaderSWF;


	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class MixedConfig implements IConfig
	{
		[Inject]
		public var injector : IInjector;
		[Inject]
		public var mediatorMap : IMediatorMap;
		[Inject]
		public var commandMap : IEventCommandMap;
		[Inject]
		public var contextView : ContextView;
		[Inject]
		public var eventDispatcher : IEventDispatcher;
		
		[Inject]
		public var viewManager: IViewManager;
		
		

		public function configure() : void
		{
			// injection 
			injector.map(IConnector).toSingleton(SocketConnector);
			injector.map(ISlotService).toSingleton(SlotService);
			injector.map(MatchTimerService).asSingleton();
			injector.map(BoosterTimerService).asSingleton();
			injector.map(MatchEnergyFallingService).asSingleton();
			//injector.map(IPaymentsPopup).toSingleton(PaymentsTablePopUp);;
			
			// model
			injector.map(UserModel).asSingleton();
			injector.map(GameModel).asSingleton();
			injector.map(MatchGameModel).asSingleton();
			
			// controller
			commandMap.map("init").toCommand(InitCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(LoginResponseProtobuf)).toCommand(OnLoginCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(LocationEnterResponseProtobuf)).toCommand(OnEnterLocationCommand);
			
			// это комманда - по приходу спин-данных (новое состояние барабана)
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(SpinResponseProtobuf)).toCommand(OnSpinCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(MatchEnterResponseProtobuf)).toCommand(OnMatchEnterCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(RoomChangedEventProtobuf)).toCommand(OnRoomChangeedCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(MatchLeaveResponseProtobuf)).toCommand(OnMatchLeaveComand);
			commandMap.map(ServiceEvent.CHANGES).toCommand(OnChageCommand);
			commandMap.map("requestRoomProgress").toCommand(RequestRoomProgressCommand);
			commandMap.map("onFlashEnergyIncrease").toCommand(OnFlashEnergyEncreaseCommand);
			commandMap.map("spin").toCommand(SpinCommand);// Это комманда при клике на кнопку
			commandMap.map("tryStopSpin").toCommand(TryStopSpin);// Это комманда проверяет горовы ли данные и если да - то стартит торможение барабана
			
			
			commandMap.map("betPerLineChanged").toCommand(BetPerLineChangingCommand);
			commandMap.map("lineNumChanged").toCommand(LineNumChangingCommand);
			commandMap.map("max_bet").toCommand(MaxBetCommand);
			
			// toMatch showSlot
			commandMap.map("toMatch").toCommand(MakeMatchEnterRequestCommand);
			commandMap.map("onBonus").toCommand(OnBonusCommand);
			commandMap.map("onBoosterClick").toCommand(OnBoosterCommand);
			commandMap.map("showPaymentsDialog").toCommand(ShowPopupCommand);
			commandMap.map("showTimeOverDialog").toCommand(ShowPopupCommand);
			commandMap.map("showProfile").toCommand(ShowPopupCommand);
			commandMap.map("showToMapMediator").toCommand(ShowPopupCommand);
			commandMap.map("showInterLevelPupup").toCommand(ShowPopupCommand);
			commandMap.map("underConstruction").toCommand(ShowPopupCommand);
			commandMap.map("showToSlotPopup").toCommand(ShowPopupCommand);
			commandMap.map("timerFinish").toCommand(ShowPopupCommand);
			
			// по событию потери коннекта, сейчас просто высовывваем попап
			// но думаю сделать отдельную комманду для этого....
			commandMap.map("connectFall").toCommand(ShowPopupCommand);
			
			
			commandMap.map("toSlot").toCommand(PlaySlotCommand);
			
			
			//lobby commands
			//commandMap.map("state_changes_request").toCommand(StateChangesCommand);

			// view ServerRoomPlayerStateProtobuf
			mediatorMap.map(IGameView).toMediator(GameViewMediator);
			mediatorMap.map(IPaymentsPopup).toMediator(PaymentsPopupMediator);
			mediatorMap.map(ITimeOverPopup).toMediator(TimeOverPopupMediator);
			mediatorMap.map(IProfilePopup).toMediator(ProfilePopupMediator);
			mediatorMap.map(BoosterPanel).toMediator(BoosterPanelMediator);
			mediatorMap.map(LobbyView).toMediator(LobbyViewMediator);
			mediatorMap.map(IInterLevelDlg).toMediator(LevelInfoMediator);
			mediatorMap.map(IApp).toMediator(ApplicationMediator);
			mediatorMap.map(IToSlot).toMediator(ToSlotMediator);
			mediatorMap.map(IToMap).toMediator(ToMapMediator);
			mediatorMap.map(InfoPopup).toMediator(InfoPopupMediator);
			mediatorMap.map(ILobbyUserInfo).toMediator(LobbyUserInfoMediator)
			//mediatorMap.map(Preloader).toMediator(PreloaderMediator)
			
			//preloader
			mediatorMap.map(Preloader).toMediator(PreloaderMediator)
			
			// startup
			// contextView.view.addChild(new MainView());
			eventDispatcher.dispatchEvent(new Event("init"));
		}
	}
}
