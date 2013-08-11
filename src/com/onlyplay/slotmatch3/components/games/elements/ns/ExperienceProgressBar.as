package com.onlyplay.slotmatch3.components.games.elements.ns
{
	import alternativa.gui.alternativagui;

	import com.onlyplay.slotmatch3.components.games.elements.ProgressBarBase;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.filters.GlowFilter;
	import flash.text.TextField;

	/**
	 * @author Design3d
	 */
	public class ExperienceProgressBar extends ProgressBarBase
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/center/pbar_user_level.png", mimeType="image/png")]
		protected static var StripClass : Class;
		protected var _progressStrip : Bitmap;
		[Embed(source="/assets/facebook/facebook/Id_1/level.png", mimeType="image/png")]
		protected static var StarClass : Class;
		private var _star : Bitmap;
		private var _mask : Shape;
		private var _levelTf : TextField;

		public function ExperienceProgressBar()
		{
			_progressStrip = new StripClass();
			addChild(_progressStrip);

			_star = new StarClass();
			addChild(_star);

			_levelTf = createLabel(15, 0xffffff, true);
			addChild(_levelTf);

			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 3;
			// filter.quality = 2;

			_levelTf.filters = [filter];

			alternativagui::_width = _star.width + _progressStrip.width - 3;
			alternativagui::_height = _star.height;

			super();

			_mask = new Shape();
			addChild(_mask);
			var g : Graphics = _mask.graphics;
			g.beginFill(0);
			g.drawRect(0, y, 100, 100);
			g.endFill();

			_progressStrip.mask = _mask;
		}

		override protected function draw() : void
		{
			super.draw();
			_progressStrip.y = int((alternativagui::_height - _progressStrip.height) >> 1) - 1;
			_progressStrip.x = alternativagui::_width - _progressStrip.width;

			_mask.x = _progressStrip.x;
			_mask.y = _progressStrip.y;
			_mask.height = _progressStrip.height;
			_mask.width = _progressStrip.width * percent;
			// _tf.width = alternativagui::_width;
			_tf.height = _progressStrip.height;
			_tf.width = 100;
			_tf.x = int((_progressStrip.width - _tf.width) >> 1) + _progressStrip.x;
			_tf.y = _progressStrip.y - 1;
			setText();

			_levelTf.width = _star.width;
			_levelTf.height = _star.height - 3;
			_levelTf.y = 5;
		}

		public function set level(val : Number) : void
		{
			_levelTf.text = val.toString();
		}
	}
}
