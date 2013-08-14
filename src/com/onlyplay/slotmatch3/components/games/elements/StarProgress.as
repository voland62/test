package com.onlyplay.slotmatch3.components.games.elements
{
	import com.greensock.TweenLite;
	import alternativa.gui.alternativagui;
	import alternativa.gui.primitives.stretch.StretchBitmap;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author Design3d
	 */
	public class StarProgress extends ProgressBarBase
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/pb_star/full.png", mimeType="image/png")]
		protected static var StripClass : Class;
		protected var _progressStrip : DisplayObject;
		protected var _mask : Shape;
		protected var _bg : Shape;
		private var _starsBase : DisplayObjectContainer;
		private var _stars : Vector.<Star> = new Vector.<Star>();
		private var targetPercent : Number;
		private var _withAnim : Boolean;

		public function StarProgress()
		{
			_bg = new Shape();
			addChild(_bg);
			_bg.visible = false;

			// _progressStrip =  new StripClass();
			_progressStrip = new StretchBitmap((new StripClass() as Bitmap).bitmapData, 10, 10, 1, 1);

			addChild(_progressStrip);

			// alternativagui::_width = ;//_progressStrip.width;
			// alternativagui::_height = ;//_progressStrip.height;

			super();

			_mask = new Shape();
			addChild(_mask);

			var g : Graphics = _mask.graphics;
			g.beginFill(0);
			g.drawRect(0, y, 100, 100);
			g.endFill();

			_starsBase = new Sprite();
			addChild(_starsBase);

			var starsCount : int = 2;

			for (var i : int = 0; i < starsCount ; i++)
			{
				 var star :Star = new Star();
				 _starsBase.addChild(star);
				 _stars.push(star);

			}

			_progressStrip.mask = _mask;
			
			_tf.visible = false;

			alternativagui::_width = 100;
		}
		
		public function setProgress ( newPercent :Number, anim:Boolean):void
		{
			
			_withAnim = anim;
			
			if (anim)
			{
				targetPercent = newPercent;
				TweenLite.to(this, 2, {percent:targetPercent});
			}
			else
			{
				percent = targetPercent = newPercent;
			}
		}
		

		override protected function draw() : void
		{
			super.draw();
			
			var padding : Number = 5;
			var lengthLine:Number =  alternativagui::_width - padding - padding;
			var delta : int = lengthLine / (_stars.length + 1 );
			var fullLenght:Number = lengthLine - delta;
			var currentLength:Number = fullLenght * percent;
			
			
			_bg.graphics.lineStyle(1);
			_bg.graphics.drawRect(0, 0, alternativagui::_width, alternativagui::_height);
			_bg.graphics.endFill();

			_bg.width = alternativagui::_width;
			// trace('_bg.width: ' + (_bg.width));
			_bg.height = alternativagui::_height;

			_progressStrip.x = padding;
			_progressStrip.y = padding;
			
			_progressStrip.width = fullLenght;

			_mask.x = _progressStrip.x;
			_mask.y = _progressStrip.y;
			_mask.height = alternativagui::_height;//20;//_progressStrip.height;
			// alternativagui::_height;
			_mask.width = currentLength;//fullLenght * percent;
			// alternativagui::_width * percent;
			// _tf.width = alternativagui::_width;
			_tf.height = alternativagui::_height;
			_tf.width = 100;
			_tf.x = int((alternativagui::_width - _tf.width) >> 1);
			_tf.y = -1;
			setText();
			
			// stars

			_starsBase.y = alternativagui::_height >> 1;
			_starsBase.x = padding;
			
			for (var i : int = 0; i < _stars.length; i++) 
			{
				var star:Star = _stars[i];
				star.x = delta * (i + 1);
				star.showStar( star.x < currentLength, _withAnim );
//				if ( star.x < currentLength )
//				{
//				}
					
			}
			
			
		}
	}
}

import com.greensock.TweenLite;
import com.greensock.TimelineLite;
import flash.display.Bitmap;
import flash.display.Sprite;


class Star extends Sprite
{
	[Embed(source="/assets/facebook/facebook/id_6/id_6/pb_star/star_empty.png", mimeType="image/png")]
	protected static var EmptyClass : Class;
	[Embed(source="/assets/facebook/facebook/id_6/id_6/pb_star/star.png", mimeType="image/png")]
	protected static var StarClass : Class;
	private var _star : Bitmap;

	public function Star()
	{
		var bg:Bitmap = new EmptyClass();
		addChild(bg);
		bg.x -= bg.width >> 1;
		bg.y -= bg.height >> 1;
		
		_star = new StarClass();
		_star.x -= (_star.width >> 1) + 0;
		_star.y -= (_star.height >> 1) + 1;
		
		addChild(_star);
		_star.visible = false;
	}

	public function showStar( val:Boolean, withAnim:Boolean) : void
	{
		// TODO: рассмотреть введение двух стэйтов
		if ( withAnim && _star.visible != val && _star.visible == false)
		{
			log ("aaa");
			var timeLine :TimelineLite = new TimelineLite();
			timeLine.append(TweenLite.to(this,1, {scaleX:1.2, scaleY:1.2}));
			timeLine.append(TweenLite.to(this,1, {scaleX:1, scaleY:1}));
		}
		_star.visible = val;
	}
}
