package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
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
//		[Embed(source="/assets/baraban/bg_lines.png", mimeType="image/png")]
//		private static var BgClass : Class;
		//private var _bg : Bitmap;
		private var _bagesNum : int = 20;
		private var _bagesBase : DisplayObjectContainer = new Sprite();
		private var _tfBase : DisplayObjectContainer = new Sprite();
		private var _textFields : Array = [];
		private static var leftIds:Array = [33,30,29,26,5,3,9,38,7,1,6,22,39,8,2,4,24,27,28,36]; 
		private static var rightIds:Array = [34,32,25,19,15,13,21,23,16,10,11,17,31,18,12,14,20,37,35,40];
		
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
		
		// --- interface ----------------------------------
		public function getBageCoordsById( id:int ):Point
		{
			id++;// ATTENTION!
			var shift:Point = new Point(11, 9);
			var bage:DisplayObject = _bagesBase.getChildByName(id.toString());
			if (bage)  return bage.localToGlobal( shift );
			log( "no bage for id:" + id); 
			return null;
		}
		
		public function setBageStateById( id:int, state:Boolean ):void
		{
			id++;
			var bage:LineBage = _bagesBase.getChildByName(id.toString()) as LineBage;
			if (bage)
			{
				bage.active = state;
			}
		}
		

		public function LinesPanel(directon : Boolean = LEFT)
		{
			
			Font.registerFont( franklin );
			Font.registerFont( franklin2 );
			
			//_bg = new BgClass();

			//addChild(_bg);
			addChild(_bagesBase);
			addChild(_tfBase);
			if (directon == RIGHT)
			{
				//_bg.scaleX = -1;
				_bagesBase.scaleX = -1;
			}
			
			reinit(directon);
			
			//_tfBase.y = _bagesBase.y = _bagesBase.height >> 1;//(_bg.height - _bagesBase.height) >> 1;
			if(directon == RIGHT) _tfBase.x = -_tfBase.width;
		}
		
		
		public function reinit( direction:Boolean ):void
		{
			var ids:Array = (direction)? leftIds : rightIds;
			
			for (var i : int = 0; i < _bagesNum; i++)
			{
				var id:int = ids[i];
				var bage : LineBage = new LineBage( id );
				bage.name = id.toString();
				_bagesBase.addChild(bage);
				bage.y = i * (bage.height + 0);

				var tf : TextField = createTextField(bage.width - 3, bage.height - 3);
				_tfBase.addChild(tf);
				tf.y = bage.y + 2;
				tf.text = id.toString();//i.toString();
			}
			
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

		public function resetBages() : void
		{
			for (var i : int = 0; i < _bagesBase.numChildren  ; i++) 
			{
				var bage :LineBage = _bagesBase.getChildAt(i) as LineBage;
				if (bage)
				{
							//setBageStateById(id, false);
					bage.active = false;
				}
			}
		}
	}
}
