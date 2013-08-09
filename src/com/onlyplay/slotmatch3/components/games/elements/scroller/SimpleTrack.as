package com.onlyplay.slotmatch3.components.games.elements.scroller
{
	import alternativa.gui.alternativagui;
	import flash.display.Graphics;
	import flash.display.Shape;
	import alternativa.gui.base.GUIobject;

	/**
	 * @author Design3d
	 */
	public class SimpleTrack extends GUIobject
	{
		private var _bg : Shape;
		private var _strip : Shape;
		public function SimpleTrack()
		{
			_bg = new Shape();
			var g:Graphics = _bg.graphics;
			g.beginFill(0, 0);
			g.drawRect(0, 0, 100, 100);
			addChild(_bg);
			
			_strip = new Shape();
//			_strip.graphics.lineStyle(1);
//			_strip.graphics.drawRect(0, 0, 1, 100);
//			_strip.graphics.endFill();
			addChild(_strip);

			alternativagui::_width = 6;
		}
		
		
		override protected function calculateWidth(value : int) : int
		{
			return alternativagui::_width;
		}
		
		override protected function draw() : void
		{
			_bg.width = alternativagui::_width;
			_bg.height = alternativagui::_height;

			//_strip.height = alternativagui::_height;
			var newX :int = alternativagui::_width >> 1;
			var g:Graphics = _strip.graphics;
			g.lineStyle(1);
			g.moveTo(newX, 0);
			g.lineTo(newX, alternativagui::_height);
			
			
		}

	}
}
