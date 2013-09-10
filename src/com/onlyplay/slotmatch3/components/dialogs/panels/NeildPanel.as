package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.container.Container;
	import alternativa.gui.primitives.stretch.StretchBitmap;

	import assets.DialogClasses;

	/**
	 * @author Andrew
	 */
	public class NeildPanel extends Container
	{
		private var _bg : StretchBitmap;
		protected var _minWidth : Number = 100;
		protected var _minHeight : Number = 250;

		public function NeildPanel()
		{
			_bg = new StretchBitmap(DialogClasses.tableBitmapData, DialogClasses.tableCorner, DialogClasses.tableCorner, DialogClasses.tableCorner, DialogClasses.tableCorner);
			addChild(_bg);

			alternativagui::_width = calculateWidth(alternativagui::_width);
			alternativagui::_height = calculateHeight(alternativagui::_height);
			
			
			
			draw();
		}

		override protected function draw() : void
		{
			super.draw();
			_bg.width = alternativagui::_width;
			_bg.height = alternativagui::_height;
		}

		override protected function calculateWidth(value : int) : int
		{
			if (value < _minWidth)
			{
				return _minWidth;
			}
			else
			{
				return value;
			}
		}

		override protected function calculateHeight(value : int) : int
		{
			if (value < _minHeight)
			{
				return _minHeight;
			}
			else
			{
				return value;
			}
		}
	}
}
