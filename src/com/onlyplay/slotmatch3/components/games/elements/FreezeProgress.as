package com.onlyplay.slotmatch3.components.games.elements
{
	import flash.geom.Point;

	import alternativa.gui.alternativagui;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;

	/**
	 * @author Design3d
	 */
	public class FreezeProgress extends ProgressBarBase
	{
		[Embed(source="assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_normal/pr_empty.png", mimeType="image/png")]
		protected static var BgClass : Class;
		[Embed(source="assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_frozen/pr_full.png", mimeType="image/png")]
		protected static var StripClass : Class;
		[Embed(source="assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_normal/light.png", mimeType="image/png")]
		protected static var LightClass : Class;
		[Embed(source="assets/facebook/facebook/id_6/id_6/multiplayer/multi_player_frozen/ornament.png", mimeType="image/png")]
		protected static var DecorClass : Class;
		[Embed(source="assets/facebook/facebook/id_6/id_6/multiplayer/cb.png", mimeType="image/png")]
		protected static var CbClass : Class;
		protected var _progressStrip : Bitmap;
		protected var _mask : Shape;
		private var _bg : Bitmap;
		private var _light : Bitmap;
		private var _decor : Bitmap;
		private var _decorLeft : Bitmap;
		private var _cb : Bitmap;

		public function FreezeProgress()
		{
			_bg = new BgClass();
			addChild(_bg);

			_progressStrip = new StripClass();
			addChild(_progressStrip);

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

			_progressStrip.mask = _mask;

			_decor = new DecorClass();
			addChild(_decor);

			_decorLeft = new DecorClass();
			addChild(_decorLeft);

			_decorLeft.scaleX = -1;

			// _tf.border = true;
			// _tf.visible = false;
		}

		override protected function draw() : void
		{
			super.draw();

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

			_tf.x = alternativagui::_width - _tf.width - 5;
			// int((alternativagui::_width - _tf.width) >> 1);
			_tf.y = 8;
			setText();
		}

		override protected function setText() : void
		{
			// super.setText();
			_tf.text = "x2";
		}
	}
}
