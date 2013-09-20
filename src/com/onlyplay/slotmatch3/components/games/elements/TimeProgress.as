package com.onlyplay.slotmatch3.components.games.elements
{
	import flash.geom.ColorTransform;
	import flash.display.Bitmap;

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
		// "D:\reps\slogmatch3_2\trunk\client\ios\puzzleslots\SlotMatch3\Resources\SceneResources\ipad\ProgressBars\big_time_progress.png"
		[Embed(source="/SceneResources/ipad/ProgressBars/big_time_progress.png")]
		protected static var StripClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/timer/icon.png"
		,scaleGridTop='19', scaleGridBottom='20',
		scaleGridLeft='52', scaleGridRight='200')]
		protected static var DecorClass : Class;
		
		protected var _progressStrip : Bitmap;
		// protected var _mask : Shape;
		private var _decor : DisplayObject;
		private var _timeTf : TextField;
		private var _maxTime : Number = 0;
		private var _currentTime : Number = 0;
		private var _pauseButton : PauseButton;
		private var _gap : Number = 8;

		public function TimeProgress()
		{
			_progressStrip = new StripClass();
			// new Shape();

			// var g : Graphics = _progressStrip.graphics;
			// g.beginGradientFill(GradientType.LINEAR, [0x0000ff, 0x00ff00], [1, 1], [230, 255]);
			// g.drawRect(0, 0, 100, 100);
			addChild(_progressStrip);

			_decor = new DecorClass();
			var _w:Number = 312; 
			_decor.width = _w;
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

			_pauseButton.x = _decor.width + 4;
			_pauseButton.y = (_decor.height - _pauseButton.height) >> 1;

			_timeTf.x = 236;
			_timeTf.y = 9;

			var progressLength : Number = 195;

			_progressStrip.height = 13;
			_progressStrip.width = Math.min(progressLength * _percent, progressLength);
			_progressStrip.x = 30;
			_progressStrip.y = 12;
//			var colorTransform : ColorTransform = new ColorTransform(1, 1, 1, 1, -255,
//											 _progressStrip.transform.colorTransform.greenOffset, 
//											 _progressStrip.transform.colorTransform.blueOffset, 
//											 _progressStrip.transform.colorTransform.alphaOffset);
			var koef:Number = getKoef();
			
			var colorTransform : ColorTransform = new ColorTransform();
			colorTransform.redMultiplier = 1 * (1 - koef);
			colorTransform.blueMultiplier = 0;
			colorTransform.greenMultiplier = 0;
			
			var colorTransform2:ColorTransform = new ColorTransform();
			colorTransform2.redMultiplier = 85/255 * koef;
			colorTransform2.greenMultiplier= 129/255 * koef;
			colorTransform2.blueMultiplier = 1 * koef;
			
			//colorTransform2.concat( colorTransform );			
			var mix:ColorTransform = new ColorTransform();
			mix.redMultiplier = colorTransform.redMultiplier + colorTransform2.redMultiplier;
			mix.greenMultiplier = colorTransform.greenMultiplier + colorTransform2.greenMultiplier;
			mix.blueMultiplier = colorTransform.blueMultiplier + colorTransform2.blueMultiplier;
			
			_progressStrip.transform.colorTransform = mix;

			setTime();
		}

		private function getKoef() : Number
		{
			if ( _percent > 0.4 )
			{
				return 1;
			}else if ( _percent < 0.2 )
			{
				return 0;
			}else
			{
				return 5 * _percent - 1;
			}
			return 0;
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
