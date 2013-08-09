package com.onlyplay.slotmatch3.components.games.slot
{
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Ease;
	import com.greensock.easing.Quart;
	import com.greensock.easing.Expo;
	import com.greensock.easing.FastEase;
	import com.greensock.easing.Strong;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Sine;
	import flash.events.Event;
	import com.greensock.TweenLite;
	import com.onlyplay.slotmatch3.components.games.Util;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;

	/**
	 * @author Andrew
	 */
	public class Baraban extends Sprite
	{
		private var _bg : Sprite;
		private var _w : Number = 80;
		public var _itemHeight : Number = 84;
		private var _itemsNum : int = 5;
		private var _h : Number = _itemHeight * _itemsNum;
		private var _baraban : Sprite;
		private var _itemsTypesNum : int = 12;
		private var _items : Array = [];
		[Embed(source="/assets/baraban/icon/1.png", mimeType="image/png")]
		private static var Icon_1_Class : Class;
		[Embed(source="/assets/baraban/icon/2.png", mimeType="image/png")]
		private static var Icon_2_Class : Class;
		[Embed(source="/assets/baraban/icon/3.png", mimeType="image/png")]
		private static var Icon_3_Class : Class;
		[Embed(source="/assets/baraban/icon/4.png", mimeType="image/png")]
		private static var Icon_4_Class : Class;
		[Embed(source="/assets/baraban/icon/5.png", mimeType="image/png")]
		private static var Icon_5_Class : Class;
		[Embed(source="/assets/baraban/icon/6.png", mimeType="image/png")]
		private static var Icon_6_Class : Class;
		[Embed(source="/assets/baraban/icon/7.png", mimeType="image/png")]
		private static var Icon_7_Class : Class;
		[Embed(source="/assets/baraban/icon/8.png", mimeType="image/png")]
		private static var Icon_8_Class : Class;
		[Embed(source="/assets/baraban/icon/9.png", mimeType="image/png")]
		private static var Icon_9_Class : Class;
		[Embed(source="/assets/baraban/icon/10.png", mimeType="image/png")]
		private static var Icon_10_Class : Class;
		[Embed(source="/assets/baraban/icon/11.png", mimeType="image/png")]
		private static var Icon_11_Class : Class;
		[Embed(source="/assets/baraban/icon/12.png", mimeType="image/png")]
		private static var Icon_12_Class : Class;
		private static var _iconsMap : Array = [Icon_1_Class, Icon_2_Class, Icon_3_Class, Icon_4_Class, Icon_5_Class, Icon_6_Class, Icon_7_Class, Icon_8_Class, Icon_9_Class, Icon_10_Class, Icon_11_Class, Icon_12_Class,];
		private var _mask : Sprite;
		
		
		[Embed(source="/assets/facebook/facebook/baraban/shadow2.png", mimeType="image/png")]
		private static var TintClass : Class;
		private var _tint:Bitmap;
		

		public function Baraban()
		{
			log("Baraban.Baraban()");
			_bg = new Sprite();
			addChild(_bg);

			_baraban = new Sprite();
			_baraban.y = _h;
			addChild(_baraban);

			_mask = new Sprite();
			addChild(_mask);
			_baraban.mask = _mask;
			
			_tint = new TintClass();
			_tint.height +=2;// heignt correction TODO: попросить Олю сделать длину на писксель больше
			_tint.y = int(_h -_tint.height) >> 1;
			addChild(_tint);

			redraw();

			initModel();
			initView();
		}

		private function initView() : void
		{
			_baraban.removeChildren();

			for (var i : int = 0; i < _items.length; i++)
			{
				var itemView : Sprite = createItemView(_items[i]);
				_baraban.addChild(itemView);
				itemView.y = - (i + 1) * _itemHeight;
			}
		}

		private function createItemView(itemType : int) : Sprite
		{
			var itemView : Sprite = new Sprite;
			var image : Bitmap = new _iconsMap[ itemType ]();
			image.y = int((_itemHeight - image.height) >> 1);
			itemView.addChild(image);
			return itemView;
		}

		private function initModel() : void
		{
			_items.length = 0;
			for (var i : int = 0; i < _itemsNum; i++)
			{
				_items.push(Util.randInt(12));
			}
		}

		private function redraw() : void
		{
			var g : Graphics = _bg.graphics;
			g.lineStyle(1);
			g.drawRect(0, 0, _w, _h);
			g.endFill();

			var g : Graphics = _mask.graphics;
			g.beginFill(0);
			g.drawRect(0, 0, _w, _h);
			g.endFill();
		}

		public function spin(newState : Array, duration:Number) : void
		{
			// делаем, пока по-самому простому - в лоб
			var fakeItemsNum:int = 20 * duration;// attention!!! duration in seconds
			var fakeItems : Array = [];
			for (var i : int = 0; i < fakeItemsNum; i++)
			{
				fakeItems.push(Util.randInt(_itemsTypesNum));
			}

			_items = _items.concat(fakeItems, newState);

			initView();

			startAnim(duration);
		}

		private function startAnim(duration:Number) : void
		{
			// _baraban.cacheAsBitmap = true;

			//var filter : BitmapFilter = new BlurFilter(0, 6);
			//_baraban.filters = [filter];

			var newY : Number = (_items.length - 0) * _itemHeight;
			
			TweenLite.to(_baraban, 0.5, {y:(_h - 20),
				onComplete: 
				function ():void{
					TweenLite.to(_baraban, duration, {y:newY, 
					
						//ease:Sine.easeOut,
						ease:Linear.easeOut,
						//ease:Strong.easeOut,
						//ease:Expo.easeOut,
						//ease:Quart.easeOut,
						//ease:Cubic.easeInOut,
						//ease:Cubic.easeIn,
						//ease:Cubic.easeOut,
						onComplete:reset
					
					});
				
				}});
		}

		private function reset() : void
		{
			_items = _items.slice(-_itemsNum);
			_baraban.y = _h;
			//_baraban.filters = [];
			initView();
			dispatchEvent(new Event("AnimEnded"));
		}
	}
}
