package com.onlyplay.slotmatch3.components.games.elements
{
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	import alternativa.gui.alternativagui;

	import com.greensock.TweenLite;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Point;

	/**
	 * @author Design3d
	 */
	public class FreezeProgress extends ProgressBarBase
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_normal/pr_empty.png", mimeType="image/png")]
		protected static var BgClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_lock/Untitled-8.png", mimeType="image/png")]
		protected static var LockedStripClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_normal/pr_full.png", mimeType="image/png")]
		protected static var NormalStripClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_frozen/pr_full.png", mimeType="image/png")]
		protected static var FrozenStripClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_normal/light.png", mimeType="image/png")]
		protected static var LightClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_frozen/ornament.png", mimeType="image/png")]
		protected static var DecorClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/multiplayer/cb.png", mimeType="image/png")]
		protected static var CbClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/microbonus/microbonus_hod.png", mimeType="image/png")]
		protected static var FlashIconClass : Class;
		
		protected var _progressStrip : Bitmap;
		protected var _mask : Shape;
		private var _bg : Bitmap;
		private var _light : Bitmap;
		private var _decor : Bitmap;
		private var _decorLeft : Bitmap;
		private var _cb : Bitmap;
		private var _flashIcon : Bitmap;
		
		
		private var _label : String;
		private var _withAnim : Boolean;
		private var targetPercent : Number;
		
		public static const NORMAL :int = 0;
		public static const FROZEN :int = 1;
		public static const LOCKED :int = 2;
		private var _visualState : int = NORMAL;
		public var stripsBase:DisplayObjectContainer = new Sprite();
		private var _frozenStrip : Bitmap;
		private var _normalStrip : Bitmap;
		private var _lockedStrip : Bitmap;

		public function FreezeProgress()
		{
			_bg = new BgClass();
			addChild(_bg);
			
			_frozenStrip  = new FrozenStripClass();
			_frozenStrip.visible = false;
			stripsBase.addChild( _frozenStrip );
			
			_normalStrip = new NormalStripClass();
			_normalStrip.visible = false;
			stripsBase.addChild(_normalStrip);
			
			_lockedStrip = new LockedStripClass();
			_lockedStrip.visible = false;
			stripsBase.addChild(_lockedStrip);
			
			addChild(stripsBase);

			

			_light = new LightClass();
			addChild(_light);
			
			//_cb = new CbClass();
			//addChild(_cb);
			
			
			

			alternativagui::_width = _bg.width;
			// _progressStrip.width;
			alternativagui::_height = _bg.height;
			// _progressStrip.height;

			super();

			_mask = new Shape();
			addChild(_mask);

			var g : Graphics = _mask.graphics;
			g.beginFill(0);
			g.drawRect(0, y, 100, 100);
			g.endFill();

			stripsBase.mask = _mask;

			_decor = new DecorClass();
			addChild(_decor);

			_decorLeft = new DecorClass();
			addChild(_decorLeft);

			_decorLeft.scaleX = -1;
			
			
			_flashIcon = new FlashIconClass();
			addChild(_flashIcon);
			

			// _tf.border = true;
			// _tf.visible = false;
			
			draw();
		}
		
				
		public function setProgress ( newPercent :Number, anim:Boolean):void
		{
			
			_withAnim = anim;
			TweenLite.killTweensOf(this);
			
			if (anim && newPercent > _percent)
			{
				targetPercent = newPercent;
				TweenLite.to(this, 0.5, {percent:targetPercent});
			}
			else
			{
				percent = targetPercent = newPercent;
			}
		}
		

		override protected function draw() : void
		{
			super.draw();
			
			_frozenStrip.visible = _normalStrip.visible = _lockedStrip.visible = false;
			
			switch( _visualState ){
				case NORMAL:
					_progressStrip = _normalStrip;
					break;
				case FROZEN:
					_progressStrip = _frozenStrip;
					break;
				case LOCKED:
					_progressStrip = _lockedStrip;
					break;
				default:
			}
			
			_progressStrip.visible = true;
			
			_flashIcon.x = 7;
			
			_progressStrip.x = 28;
			_progressStrip.y = 8;

			_mask.x = _progressStrip.x;
			_mask.y = _progressStrip.y;

			_decor.x = _progressStrip.x;
			_decor.y = _progressStrip.y + 1;

			_decorLeft.x = _progressStrip.x + _progressStrip.width;
			_decorLeft.y = _decor.y;

			var lightShift : Point = new Point(-30, 3);
			_light.x = _progressStrip.x + _progressStrip.width * percent + lightShift.x;
			_light.y = lightShift.y;

			_mask.height = _progressStrip.height;
			// alternativagui::_height;
			_mask.width = _progressStrip.width * percent;
			// alternativagui::_width * percent;
			// _tf.width = alternativagui::_width;

			_tf.height = alternativagui::_height;
			_tf.width = 30;
			_tf.height = 20;

			setText();
			_tf.x = alternativagui::_width - _tf.width - 5;
			// int((alternativagui::_width - _tf.width) >> 1);
			_tf.y = 8;
		}

		override protected function setText() : void
		{
			// super.setText();
			//_tf.text = "x2";
			_tf.text = String(_label);
		}

		public function get label() : String
		{
			return _label;
		}

		public function set label(label : String) : void
		{
			_label = label;
			draw();
		}

		public function get visualState() : int
		{
			return _visualState;
		}

		public function set visualState(visualState : int) : void
		{
			_visualState = visualState;
			draw();
		}
	}
}
