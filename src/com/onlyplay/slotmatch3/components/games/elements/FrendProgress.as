package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;

	/**
	 * @author Design3d
	 */
	public class FrendProgress extends ProgressBarBase
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/pbar_igroki_full.png", mimeType="image/png")]
		protected static var StripClass : Class;
		protected var _progressStrip : Bitmap;
		protected var _mask : Shape;
		

		public function FrendProgress()
		{

			_progressStrip = new StripClass();
			addChild(_progressStrip);

			alternativagui::_width = _progressStrip.width;
			alternativagui::_height = _progressStrip.height;

			super();

			_mask = new Shape();
			addChild(_mask);
			var g : Graphics = _mask.graphics;
			g.beginFill(0);
			g.drawRect(0, y, 100, 100);
			g.endFill();

			_progressStrip.mask = _mask;
			
			_tf = createLabel(8, 0xf9fcbe, false);
			addChild(_tf);
			applyFilter(_tf);
		}


		override protected function draw() : void
		{
			super.draw();
			_mask.height = alternativagui::_height;
			_mask.width = alternativagui::_width * percent;
			// _tf.width = alternativagui::_width;
			_tf.height = alternativagui::_height;
			_tf.width = 100;
			_tf.x = int((alternativagui::_width - _tf.width) >> 1);
			_tf.y = -1;
			setText();
		}

	}
}
