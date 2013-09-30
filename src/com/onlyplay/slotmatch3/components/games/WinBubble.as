package com.onlyplay.slotmatch3.components.games
{
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import bmfontrenderer.BMFont;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.utils.ByteArray;

	/**
	 * @author Andrew
	 */
	public class WinBubble extends Sprite
	{
		[Embed(source="/assets/bmfont/nums.fnt", mimeType="application/octet-stream")]
		public var numsFontData : Class;
		[Embed(source="/assets/bmfont/nums_0.png")]
		public var numsSheet : Class;
		[Embed(source="/assets/bmfont/win.png")]
		public var WinLableClass : Class;
		private var _numBmp : Bitmap;
		private var _winLable : Bitmap;
		private var _amount : String;

		public function WinBubble( amount:String )
		{
			
			var letterDims:Point = new Point( 26, 32 );
			
			_amount = amount;
			var numberLength:Number = _amount.length * letterDims.x; 
			
			_winLable = new WinLableClass();
			_winLable.smoothing = true;
			addChild(_winLable);
			_winLable.x -= _winLable.width >> 1;
			_winLable.y = - _winLable.height;

			// ----------------------------------------------
			var numsBits : ByteArray = new numsFontData();
			var numFont : String = numsBits.readUTFBytes(numsBits.length);
			// trace( numFont );
			var numBmFont : BMFont = new BMFont();

			numBmFont.parseFont(numFont);
			//trace("numBmFont.glyphMap.length:" + numBmFont.glyphMap.length);
			numBmFont.addSheet(0, new numsSheet().bitmapData);

			var out2 : BitmapData = new BitmapData(numberLength, letterDims.y, true, 0xff00ff);
			//var txt:String = "0";
			numBmFont.drawString(out2, 0, 0, _amount);

			_numBmp = new Bitmap(out2);
			_numBmp.smoothing = true;
			// var outb2:Bitmap = new Bitmap( new numsSheet().bitmapData as BitmapData );
			//_numBmp.y = 100;
			_numBmp.x -= numberLength >> 1;
			addChild(_numBmp);
			
			
			//--- black filter for numbers -------------------------
			var numFilter : GlowFilter = new GlowFilter();
			numFilter.color = 0;
			numFilter.strength = 4;
			numFilter.blurX = numFilter.blurY = 3;
			_numBmp.filters = [numFilter];
			
			//--- filter -------------------------------------
			var filter:GlowFilter = new GlowFilter();
			filter.color = 0xFFFFFF;
			filter.strength = 2;
			filter.quality = 2;
			//filter.knockout;
			filter.blurX = 40;
			filter.blurY = 40;
			
			this.filters = [filter];
			
		}
	}
}
