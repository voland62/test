package com.onlyplay.slotmatch3.config
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import test.MyTestProject.model.UserModel;

	import com.onlyplay.slotmatch3.model.GameModel;
	import com.onlyplay.slotmatch3.view.IGameView;
	import com.onlyplay.slotmatch3.view.GameViewMediator;

	/**
	 * @author Design3d
	 */
	public class FlexConfig implements IConfig
	{
		[Inject]
		public var injector : IInjector;
		[Inject]
		public var mediatorMap : IMediatorMap;
		[Inject]
		public var commandMap : IEventCommandMap;
		[Inject]
		public var contextView : ContextView;

		public function configure() : void
		{
			// Map UserModel as a context enforced singleton
			injector.map(UserModel).asSingleton();
			injector.map(GameModel).asSingleton();

			mediatorMap.map(IGameView).toMediator(GameViewMediator);

			// Execute UserSignInCommand when UserEvent.SIGN_IN
			// is dispatched on the context's Event Dispatcher
			// commandMap.map(UserEvent.SIGN_IN).toCommand(UserSignInCommand);
			// commandMap.map("cool").toCommand(MyTestCommand);

			// The "view" property is a DisplayObjectContainer reference.
			// If this was a Flex application we would need to cast it
			// as an IVisualElementContainer and call addElement().
			// contextView.view.addChild(new MainView());
		}
	}
}
