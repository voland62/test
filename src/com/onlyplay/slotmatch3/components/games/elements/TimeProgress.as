package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;

	import com.onlyplay.slotmatch3.components.games.Util;

	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.filters.GlowFilter;
	import flash.text.TextField;

	/**
	 * @author Design3d
	 */
	public class TimeProgress extends ProgressBarBase
	{
		// [Embed(source="assets/facebook/facebook/id_6/id_6/timer/pb-full.png", mimeType="image/png")]
		// protected static var StripClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/timer/icon.png", mimeType="image/png")]
		protected static var DecorClass : Class;
		protected var _progressStrip : Shape;
		// protected var _mask : Shape;
		private var _decor : DisplayObject;
		private var _timeTf : TextField;
		private var _maxTime : Number = 0;
		private var _currentTime : Number = 0;
		private var _pauseButton : PauseButton;
		private var _gap : Number = 8;

		public function TimeProgress()
		{
			_progressStrip = new Shape();
			// new StripClass();
			var g : Graphics = _progressStrip.graphics;
			g.beginGradientFill(GradientType.LINEAR, [0x0000ff, 0x00ff00], [1, 1], [230, 255]);
			g.drawRect(0, 0, 100, 100);
			addChild(_progressStrip);

			_decor = new DecorClass();
			// _decor.alpha= 0.3;
			_pauseButton = new PauseButton();

			alternativagui::_width = _decor.width + _gap + _pauseButton.width;
			alternativagui::_height = _decor.height;

			super();

			_tf.visible = false;

			// _mask = new Shape();
			// addChild(_mask);
			// var g : Graphics = _mask.graphics;
			// g.beginFill(0);
			// g.drawRect(0, y, 100, 100);
			// g.endFill();

			// _progressStrip.mask = _mask;

			addChild(_decor);

			_timeTf = createLabel(14, 0xfffff2, true);
			_timeTf.width = 70;
			_timeTf.height = 19;
			// _timeTf.border = true;
			addChild(_timeTf);

			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 3;

			_timeTf.filters = [filter];

			addChild(_pauseButton);

			draw();
		}

		override protected function draw() : void
		{
			super.draw();
			// _mask.height = alternativagui::_height;
			// _mask.width = alternativagui::_width * percent;
			// _tf.width = alternativagui::_width;
			// _tf.height = alternativagui::_height;
			// _tf.width = 100;
			// _tf.x = int((alternativagui::_width - _tf.width) >> 1);
			// _tf.y = -1;
			// setText();

			_pauseButton.x = _decor.width + _gap;
			_pauseButton.y = (_decor.height - _pauseButton.height) >> 1;

			_timeTf.x = 230;
			_timeTf.y = 9;

			var progressLength : Number = 192;

			_progressStrip.height = 13;
			_progressStrip.width = Math.min(progressLength * _percent, progressLength);
			_progressStrip.x = 30;
			_progressStrip.y = 12;

			setTime();
		}

		private function setTime() : void
		{
			_timeTf.text = Util.getTimeString(_currentTime);
		}

		public function get maxTime() : Number
		{
			return _maxTime;
		}

		public function set maxTime(maxTime : Number) : void
		{
			_maxTime = maxTime;
			percent = _currentTime / _maxTime;
		}

		public function get currentTime() : Number
		{
			return _currentTime;
		}

		public function set currentTime(currentTime : Number) : void
		{
			_currentTime = currentTime;
			percent = _currentTime / _maxTime;
		}
	}
}
