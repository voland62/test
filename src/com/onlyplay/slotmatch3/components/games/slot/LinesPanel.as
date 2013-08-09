package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.text.AntiAliasType;
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.Font;
	import flash.text.TextField;

	/**
	 * @author Design3d
	 */
	public class LinesPanel extends Sprite
	{
		public static const RIGHT : Boolean = false;
		public static const LEFT : Boolean = true;
		[Embed(source="/assets/baraban/bg_lines.png", mimeType="image/png")]
		private static var BgClass : Class;
		private var _bg : Bitmap;
		private var _bagesNum : int = 20;
		private var _bagesBase : DisplayObjectContainer = new Sprite();
		private var _tfBase : DisplayObjectContainer = new Sprite();
		private var _textFields : Array = [];
		
		[Embed( source="/assets/font/FranklinGothicDemiC.otf", 
		fontName="franklin",
		embedAsCFF="false",
		mimeType="application/x-font"
		, unicodeRange = "U+0030-U+0039"
		)]
		private var franklin : Class;
		
		[Embed( source="/assets/font/FranklinGothicDemiCondC.otf", 
		fontName="franklin2",
		mimeType="application/x-font",
		embedAsCFF="false"
		,unicodeRange = "U+0030-U+0039"
		)]
		private var franklin2 : Class;

		public function LinesPanel(directon : Boolean = LEFT)
		{
			
			Font.registerFont( franklin );
			Font.registerFont( franklin2 );
			
			_bg = new BgClass();

			addChild(_bg);
			addChild(_bagesBase);
			addChild(_tfBase);
			if (directon == RIGHT)
			{
				_bg.scaleX = -1;
				_bagesBase.scaleX = -1;
			}

			for (var i : int = 0; i < _bagesNum; i++)
			{
				var bage : LineBage = new LineBage();
				_bagesBase.addChild(bage);
				bage.y = i * (bage.height + 0);

				var tf : TextField = createTextField(bage.width - 3, bage.height - 3);
				_tfBase.addChild(tf);
				tf.y = bage.y + 2;
				tf.text = i.toString();
			}

			_tfBase.y = _bagesBase.y = (_bg.height - _bagesBase.height) >> 1;
			if(directon == RIGHT) _tfBase.x = -_tfBase.width;
		}

		private function createTextField(w : Number, h : Number) : TextField
		{
			var textFormat:TextFormat = new TextFormat();
			textFormat.size = 10;
			
			textFormat.font = "franklin2";
			textFormat.align = TextFormatAlign.CENTER;
			
			
			var tf : TextField = new TextField();
			tf.textColor = 0xf5d6a8;
			//tf.antiAliasType = AntiAliasType.ADVANCED;
			
			tf.defaultTextFormat = textFormat;
			
			
			tf.embedFonts = true;
			tf.multiline = false;
			tf.selectable = false;
			//tf.border = true;
			tf.width = w;
			tf.height = h;
			return tf;
		}
	}
}
