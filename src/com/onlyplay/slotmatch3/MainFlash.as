package com.onlyplay.slotmatch3
{
	import alternativa.init.GUI;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import com.onlyplay.slotmatch3.components.FlashGameView;
	import com.onlyplay.slotmatch3.config.FlashConfig;
	import com.onlyplay.slotmatch3.view.IGameView;

	import org.flintparticles.twoD.renderers.BitmapRenderer;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;

	/**
	 * @author Andrew
	 * http://10.1.1.145:8080/slotmatch3.html
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="760", height="570")]
	public class MainFlash extends Sprite
	{
		private var franklin : Class;
		private var _context : IContext;
		private var _flashGameView : IGameView;
		private var _renderer : BitmapRenderer;

		public function MainFlash()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.stageFocusRect = false;

			//
			this.mouseEnabled = false;
			this.tabEnabled = false;

			GUI.init(stage);
			GUI.hideLogo();
			//

			_context = new Context()
				.install(MVCSBundle)
				.configure(FlashConfig)
				.configure(new ContextView(this));

			//
			_renderer = new BitmapRenderer(new Rectangle(0, 0, 760, 570));
			_flashGameView = new FlashGameView( _renderer );
			addChild(_flashGameView as DisplayObject);
			//
			//
			// в обход контроллера? Почему?
			// может лучше диспатчить?
			_flashGameView.setSlotState();
			// _flashGameView.setMatchState();

			_flashGameView.w = stage.stageWidth;
			_flashGameView.h = stage.stageHeight;
			
			// рендерер для партиклов
			addChild(_renderer);


			onResize();

			stage.addEventListener(Event.RESIZE, onResize);
		}

		private function onResize(e : Event = null) : void
		{
			// _flashSlotsView.w = stage.stageWidth;
			// _flashSlotsView.h = stage.stageHeight;
			(_flashGameView as DisplayObject).x = int((stage.stageWidth - _flashGameView.w) >> 1);
			(_flashGameView as DisplayObject).y = int((stage.stageHeight - _flashGameView.h) >> 1);
		}
	}
}
