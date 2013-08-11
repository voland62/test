package com.onlyplay.slotmatch3.components.games.elements.scroller
{
	import alternativa.gui.alternativagui;

	import flash.display.Graphics;
	import flash.display.DisplayObject;
	import flash.display.Shape;

	import alternativa.gui.controls.button.BaseButton;

	/**
	 * @author Design3d
	 */
	public class SimpleScrollButton extends BaseButton
	{
		public function SimpleScrollButton()
		{
			alternativagui::_height = 10;
			alternativagui::_width = 6;

			stateUP = createShape(0xff8000);
			stateOVER = createShape(0xffbe7d);
			stateDOWN = createShape(0xa85400);
			stateOFF = createShape(0x808080);
		}

		private function createShape(color : uint) : DisplayObject
		{
			var w : Number = alternativagui::_width;
			var h : Number = alternativagui::_height;

			var shape : Shape = new Shape();
			var g : Graphics = shape.graphics;
			g.beginFill(color);
			g.drawRect(0, 0, w, h);
			g.endFill();
			return shape;
		}

		override protected function calculateWidth(value : int) : int
		{
			return alternativagui::_width;
			// return super.calculateWidth(value);
		}

		override protected function calculateHeight(value : int) : int
		{
			return value;
//			if (_autoHeight)
//			{
//				return _minHeight;
//			}
//			else
//			{
//				if (value < _minHeight)
//				{
//					return _minHeight;
//				}
//				else
//				{
//					return value;
//				}
//			}
		}
	}
}
