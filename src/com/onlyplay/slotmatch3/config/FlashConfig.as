package com.onlyplay.slotmatch3.config
{
	import net.IConnector;
	import net.MessagesMap;
	import net.SocketConnector;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import test.MyTestProject.model.UserModel;

	import com.onlyplay.slotmatch3.components.games.elements.booster.BoosterPanel;
	import com.onlyplay.slotmatch3.controller.InitCommand;
	import com.onlyplay.slotmatch3.controller.MakeMatchEnterRequestCommand;
	import com.onlyplay.slotmatch3.controller.OnChageCommand;
	import com.onlyplay.slotmatch3.controller.OnEnterLocationCommand;
	import com.onlyplay.slotmatch3.controller.OnLoginCommand;
	import com.onlyplay.slotmatch3.controller.OnMatchEnterCommand;
	import com.onlyplay.slotmatch3.controller.OnRoomChangeedCommand;
	import com.onlyplay.slotmatch3.controller.RequestRoomProgressCommand;
	import com.onlyplay.slotmatch3.controller.currentBetChanging.BetPerLineChangingCommand;
	import com.onlyplay.slotmatch3.controller.currentBetChanging.LineNumChangingCommand;
	import com.onlyplay.slotmatch3.controller.currentBetChanging.MaxBetCommand;
	import com.onlyplay.slotmatch3.controller.match.OnBonusCommand;
	import com.onlyplay.slotmatch3.controller.match.OnBoosterCommand;
	import com.onlyplay.slotmatch3.controller.match.OnFlashEnergyEncreaseCommand;
	import com.onlyplay.slotmatch3.controller.spin.OnSpinCommand;
	import com.onlyplay.slotmatch3.controller.spin.SpinCommand;
	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.model.MatchGameModel;
	import com.onlyplay.slotmatch3.services.BoosterTimerService;
	import com.onlyplay.slotmatch3.services.ISlotService;
	import com.onlyplay.slotmatch3.services.MatchEnergyFallingService;
	import com.onlyplay.slotmatch3.services.MatchTimerService;
	import com.onlyplay.slotmatch3.services.ServiceEvent;
	import com.onlyplay.slotmatch3.services.SlotService;
	import com.onlyplay.slotmatch3.view.BoosterPanelMediator;
	import com.onlyplay.slotmatch3.view.GameViewMediator;
	import com.onlyplay.slotmatch3.view.IGameView;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public class FlashConfig implements IConfig
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
		public var eventDispatcher:IEventDispatcher;

		public function configure() : void
		{
			// injection
			injector.map(IConnector).toSingleton(SocketConnector);
			injector.map(ISlotService).toSingleton(SlotService);
			injector.map(MatchTimerService).asSingleton();
			injector.map(BoosterTimerService).asSingleton();
			injector.map(MatchEnergyFallingService).asSingleton();
			
			// model
			injector.map(UserModel).asSingleton();
			injector.map(GameModel).asSingleton();
			injector.map(MatchGameModel).asSingleton();
			
			// controller
			commandMap.map("init").toCommand(InitCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(LoginResponseProtobuf)).toCommand(OnLoginCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(LocationEnterResponseProtobuf)).toCommand(OnEnterLocationCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(SpinResponseProtobuf)).toCommand(OnSpinCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(MatchEnterResponseProtobuf)).toCommand(OnMatchEnterCommand);
			commandMap.map(ServiceEvent.PREFIX + MessagesMap.getIdByClass(RoomChangedEventProtobuf)).toCommand(OnRoomChangeedCommand);
			commandMap.map(ServiceEvent.CHANGES).toCommand(OnChageCommand);
			commandMap.map("requestRoomProgress").toCommand(RequestRoomProgressCommand);
			commandMap.map("onFlashEnergyIncrease").toCommand(OnFlashEnergyEncreaseCommand);
			commandMap.map("spin").toCommand(SpinCommand);
			
			commandMap.map("betPerLineChanged").toCommand(BetPerLineChangingCommand);
			commandMap.map("lineNumChanged").toCommand(LineNumChangingCommand);
			commandMap.map("max_bet").toCommand(MaxBetCommand);
			
			// toMatch
			commandMap.map("toMatch").toCommand(MakeMatchEnterRequestCommand);
			commandMap.map("onBonus").toCommand(OnBonusCommand);
			commandMap.map("onBoosterClick").toCommand(OnBoosterCommand);
			//
			
			// view ServerRoomPlayerStateProtobuf
			mediatorMap.map(IGameView).toMediator(GameViewMediator);
			mediatorMap.map(BoosterPanel).toMediator(BoosterPanelMediator);

			
			// startup
			// contextView.view.addChild(new MainView());
			eventDispatcher.dispatchEvent(new Event("init"));
			
			
		}
	}
}
