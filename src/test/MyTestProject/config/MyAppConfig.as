package test.MyTestProject.config
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import test.MyTestProject.controller.MyTestCommand;
	import test.MyTestProject.model.UserModel;

	import flash.events.MouseEvent;

	/**
	 * @author Andrew
	 */
	public class MyAppConfig implements IConfig
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

			// Create a UserProfileMediator for each UserProfileView
			// that lands inside of the Context View
			//mediatorMap.map(UserProfileView).toMediator(UserProfileMediator);

			// Execute UserSignInCommand when UserEvent.SIGN_IN
			// is dispatched on the context's Event Dispatcher
			//commandMap.map(UserEvent.SIGN_IN).toCommand(UserSignInCommand);
			commandMap.map("cool").toCommand(MyTestCommand);

			// The "view" property is a DisplayObjectContainer reference.
			// If this was a Flex application we would need to cast it
			// as an IVisualElementContainer and call addElement().
			//contextView.view.addChild(new MainView());
		}
	}
}
