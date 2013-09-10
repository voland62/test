package com.onlyplay.slotmatch3.components.games.elements.scrollArea
{
	import alternativa.gui.alternativagui;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	import alternativa.gui.container.scrollArea.ScrollArea;

	/**
	 * @author Design3d
	 */
	public class PaymentsScrollArea extends ScrollArea
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/ paytable/bg_paytable.png", mimeType="image/png")]
		private static var BgClass : Class;
		private var _bg : Bitmap;

		public function PaymentsScrollArea()
		{
			use namespace alternativagui;
			
			_bg = new BgClass();
			addChild(_bg);
			
			super();
			
			_width = _bg.width;
			_height = _bg.height;
			
			
			
			//var r:Rectangle = new Rectangle(0, 10, _width, _height - _pa);
			//var  
			
		}
	}
}
