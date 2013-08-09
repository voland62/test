package com.onlyplay.slotmatch3.components.games.elements.booster
{
	import alternativa.gui.base.GUIobject;

	import com.onlyplay.slotmatch3.components.games.Util;

	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Andrew
	 */
	public class Booster extends GUIobject
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/boost_main.png", mimeType="image/png")]
		protected static var BgClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/num.png", mimeType="image/png")]
		protected static var NumClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/active_main.png", mimeType="image/png")]
		protected static var ProgressStrokeClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/molot_a.png", mimeType="image/png")]
		public static var HammerAClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/molot_n.png", mimeType="image/png")]
		public static var HammerNClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/bomba_a.png", mimeType="image/png")]
		public static var BombaAClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/bomba_n.png", mimeType="image/png")]
		public static var BombaNClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/kub_a.png", mimeType="image/png")]
		public static var KubAClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/kub_n.png", mimeType="image/png")]
		public static var KubNClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/time_a.png", mimeType="image/png")]
		public static var HourGlassAClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/booster/time_n.png", mimeType="image/png")]
		public static var HourGlassNClass : Class;
		private var _bg : DisplayObject;
		private var _mask : Shape;
		private var _icon : DisplayObject;
		private var _center : Point = new Point(39, 38);
		private var _persent : Number;
		private var _numTf : TextField;
		private var _labelTf : TextField;
		public const ACTIVE_STATE : int = 0;
		public const DISACTIVE_STATE : int = 1;
		private var _state : int = ACTIVE_STATE;
		private var _skin : Array;
		private var _activeSkin : DisplayObject;
		private var _disactiveSkin : DisplayObject;
		
		public static const BOMB:int = 1;
		public static const CUBE:int = 2;
		public static const HAMMER:int = 3;
		public static const TIME:int = 4;

		public function Booster()
		{
			super();
			
			mouseEnabled = true;
			
			_bg = new BgClass();
			addChild(_bg);

			var num : DisplayObject = new NumClass();
			addChild(num);
			num.x = 80;
			num.y = 24;

			var _progress : DisplayObject = new ProgressStrokeClass();
			addChild(_progress);
			_progress.x = 1;

			// _icon = new HammerClass();
			// addChild(_icon);

			_mask = new Shape();
			addChild(_mask);
			_progress.mask = _mask;

			_numTf = createLabel(15, 0xfef4cf, true);
			addChild(_numTf);
			_numTf.x = 80;
			_numTf.y = 29;
			_numTf.width = 30;
			_numTf.height = 22;
			 //_numTf.border = true;
			
			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 3;

			_numTf.filters = [filter];

			_numTf.text = String(1);

			_labelTf = createLabel(12, 0xfffff2, true);
			addChild(_labelTf);
			_labelTf.width = 80;
			_labelTf.height = 18;
			// _labelTf.border = true;
			_labelTf.x = -2;
			_labelTf.y = 66;
			_labelTf.text = "Мега-бомба";

			_persent = 0.25;

			draw();
		}
		
		

		protected function createLabel(size : Number, color : int, bold : Boolean) : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			// tf.border = true;
			tf.textColor = color;
			tf.selectable = false;
			tf.mouseEnabled = false;

			var format : TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			format.font = "_sans";
			format.size = size;
			format.bold = bold;
			tf.defaultTextFormat = format;

			return tf;
		}

		override protected function draw() : void
		{
			// _mask.alpha = 0.5;
			var g : Graphics = _mask.graphics;
			var base : Number = Math.PI * 0.5;
			var phy : Number = Math.PI * 0.25 - 0.1;
			var start : Number = base + phy;
			var end : Number = base + 2 * Math.PI - phy;
			var p : Number = Math.min(_persent, 1);
			var current : Number = (end - start) * p + start;
			g.beginFill(0);
			Util.drawCircleSegment(g, _center, start, current, 38);
			g.endFill();

			// state stuff
			if (_skin)
			{
				if (_state == ACTIVE_STATE)
				{
					_icon = activeSkin;
				}
				if (_state == DISACTIVE_STATE)
				{
					_icon = disactiveSkin;
				}
			}

			if (_icon)
			{
				_icon.x = _center.x - (_icon.width >> 1);
				_icon.y = _center.y - (_icon.height >> 1);
			}
		}

		public function get skin() : Array
		{
			return _skin;
		}

		public function set skin(skin : Array) : void
		{
			_skin = skin;
			draw();
		}

		public function get state() : int
		{
			return _state;
		}

		public function set state(state : int) : void
		{
			if (state == ACTIVE_STATE && state == DISACTIVE_STATE)
			{
				_state = state;
				draw();
			}
			else
			{
				log("Booster.state(state)", "incorrect state:" + state);
			}
		}

		public function get activeSkin() : DisplayObject
		{
			if (!_activeSkin)
			{
				_activeSkin = new _skin[0]();
				addChild(_activeSkin);
			}
			return _activeSkin;
		}

		public function get disactiveSkin() : DisplayObject
		{
			if (!_disactiveSkin)
			{
				_disactiveSkin = new _skin[1]();
				addChild(_activeSkin);
			}
			return _disactiveSkin;
		}

		public function get label() : String
		{
			return _labelTf.text;
		}

		public function set label(label : String) : void
		{
			_labelTf.text = label;
		}

		public function get num() : int
		{
			return int(_numTf.text);
		}

		public function set num(num : int) : void
		{
			_numTf.text = num.toString();
		}

		public function get persent() : Number
		{
			return _persent;
		}

		public function set persent(persent : Number) : void
		{
			_persent = persent;
			draw();
		}
	}
}
