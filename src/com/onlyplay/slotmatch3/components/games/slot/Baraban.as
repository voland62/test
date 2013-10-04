package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import flash.display.BitmapData;

	import assets.AssetsStorage;

	import flash.utils.Dictionary;
	import flash.display.DisplayObject;

	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.onlyplay.slotmatch3.components.games.Util;

	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;

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
		// [Embed(source="/assets/baraban/icon/1.png", mimeType="image/png")]
		// private static var Icon_1_Class : Class;
		// [Embed(source="/assets/baraban/icon/2.png", mimeType="image/png")]
		// private static var Icon_2_Class : Class;
		// [Embed(source="/assets/baraban/icon/3.png", mimeType="image/png")]
		// private static var Icon_3_Class : Class;
		// [Embed(source="/assets/baraban/icon/4.png", mimeType="image/png")]
		// private static var Icon_4_Class : Class;
		// [Embed(source="/assets/baraban/icon/5.png", mimeType="image/png")]
		// private static var Icon_5_Class : Class;
		// [Embed(source="/assets/baraban/icon/6.png", mimeType="image/png")]
		// private static var Icon_6_Class : Class;
		// [Embed(source="/assets/baraban/icon/7.png", mimeType="image/png")]
		// private static var Icon_7_Class : Class;
		// [Embed(source="/assets/baraban/icon/8.png", mimeType="image/png")]
		// private static var Icon_8_Class : Class;
		// [Embed(source="/assets/baraban/icon/9.png", mimeType="image/png")]
		// private static var Icon_9_Class : Class;
		// [Embed(source="/assets/baraban/icon/10.png", mimeType="image/png")]
		// private static var Icon_10_Class : Class;
		// [Embed(source="/assets/baraban/icon/11.png", mimeType="image/png")]
		// private static var Icon_11_Class : Class;
		// [Embed(source="/assets/baraban/icon/12.png", mimeType="image/png")]
		// private static var Icon_12_Class : Class;
		// private static var _iconsMap : Array = [Icon_1_Class, Icon_2_Class, Icon_3_Class, Icon_4_Class, Icon_5_Class, Icon_6_Class, Icon_7_Class, Icon_8_Class, Icon_9_Class, Icon_10_Class, Icon_11_Class, Icon_12_Class,];
		private var _mask : Sprite;
		[Embed(source="/assets/facebook/facebook/baraban/shadow2.png", mimeType="image/png")]
		private static var TintClass : Class;
		private var _tint : Bitmap;
		private var _map : Dictionary;

		public function Baraban()
		{
			log("Baraban.Baraban()");
			_bg = new Sprite();
			addChild(_bg);

			_baraban = new Sprite();
			_baraban.y = _h;
			addChild(_baraban);

			_mask = new Sprite();
			// addChild(_mask);
			// _baraban.mask = _mask;

			_tint = new TintClass();
			_tint.height += 2;
			// heignt correction TODO: попросить Олю сделать длину на писксель больше
			_tint.y = int(_h - _tint.height) >> 1;
			addChild(_tint);

			redraw();
		}

		public function init(map : Dictionary) : void
		{
			_map = map;
			initModel();
			initView();
		}

		private function initView() : void
		{
			_baraban.removeChildren();

			for (var i : int = 0; i < _items.length; i++)
			{
				var itemView : Sprite = createItemView(_items[i]);
				itemView.name = i.toString();
				// (_itemsNum - i).toString();// похоже на хак, да?
				_baraban.addChild(itemView);
				itemView.y = - (i + 1) * _itemHeight;
			}
		}

		private function createItemView(itemType : int) : Sprite
		{
			var itemView : Sprite = new Sprite;

			// var iconUrl:String = Util.getIconUrl( 1, 1, itemType);
			// var queue:LoaderMax = new LoaderMax();
			// queue.append(new ImageLoader( iconUrl, {name: itemType}
			//				// {name:"photo1", estimatedBytes:2400, container:this, alpha:0, width:250, height:150, scaleMode:"proportionalInside"}
			// ));
			// trace('image: ' + (image));
			// queue.getLoader(iconUrl); // new _iconsMap[ itemType ]();
			AssetsStorage.instance.getAsset(_map[ itemType ], function(bitmapData : BitmapData)
			{
				// log ( image );
				var image : Bitmap = new Bitmap(bitmapData);
				image.width = image.height = _itemHeight;
				image.smoothing = true;
				image.x = (_w - image.width) >> 1;
				// image.y = int((_itemHeight - image.height) >> 1);
				// image.y = int((image.height) >> 1);
				itemView.addChild(image);

				;
			});
			// Icons.getAssetById(itemType);
			return itemView;
		}

		private function initModel() : void
		{
			_items.length = 0;
			for (var i : int = 0; i < _itemsNum; i++)
			{
				_items.push(Util.randInt(_itemsTypesNum));
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

		public function spin(newState : Array, duration : Number) : void
		{
			// делаем, пока по-самому простому - в лоб
			var fakeItemsNum : int = 0;
			// 20 * duration;// attention!!! duration in seconds
			var fakeItems : Array = [];
			newState = newState.reverse();

			for (var i : int = 0; i < fakeItemsNum; i++)
			{
				fakeItems.push(Util.randInt(_itemsTypesNum));
			}

			_items = _items.concat(fakeItems, newState);

			initView();

			// startAnim(duration);
			startAnim2(duration);
		}

		// private var _timer:Timer = new Timer(0);
		private var _endTime : Number;

		private function startAnim2(duration : Number = NaN) : void
		{
			if ( !isNaN(duration) && duration > 0 )
			{
				_endTime = getTimer() + duration * 1000;
			}
			else
			{
				_endTime = NaN;
			}

			addEventListener(Event.ENTER_FRAME, loop);
		}

		private function loop(e : Event) : void
		{
			if ( !isNaN(_endTime) && (_endTime - getTimer()) <= 0)
			{
				removeEventListener(Event.ENTER_FRAME, loop);
				return;
			}

			var delta : Number = 0.5;
			for (var i : int = 0; i < _baraban.numChildren; i++)
			{
				var icon : DisplayObject = _baraban.getChildAt(i);
				var base : Number = _h + _itemHeight;
				icon.y = ((icon.y + delta + base) % base) - base;
			}
		}

		public function stopRequest(newModel : Array) : void
		{
			_items = _items.concat(newModel);
			
			//_baraban.removeChildren();

			for (var i : int = 0; i < _items.length; i++)
			{
				if ( !_baraban.getChildByName(i.toString()))
				{
					var itemView : Sprite = createItemView(_items[i]);
					itemView.name = i.toString();
					_baraban.addChild(itemView);
					itemView.y = - (i + 1) * _itemHeight;
					
					log("Baraban.stopRequest(newModel)");
					
				}
				
			}
		}

		private function startAnim(duration : Number) : void
		{
			// _baraban.cacheAsBitmap = true;

			// var filter : BitmapFilter = new BlurFilter(0, 6);
			// _baraban.filters = [filter];

			var newY : Number = (_items.length - 0) * _itemHeight;

			TweenLite.to(_baraban, 0.5, {y:(_h - 20), onComplete:function() : void
			{
				TweenLite.to(_baraban, duration, {y:newY,// ease:Sine.easeOut, 
				ease:Linear.easeOut,// ease:Strong.easeOut,
				// ease:Expo.easeOut,
				// ease:Quart.easeOut,
				// ease:Cubic.easeInOut,
				// ease:Cubic.easeIn,
				// ease:Cubic.easeOut, 
				onComplete:reset});
			}});
		}

		private function reset() : void
		{
			_items = _items.slice(-_itemsNum);
			_baraban.y = _h;
			// _baraban.filters = [];
			initView();
			dispatchEvent(new Event("AnimEnded"));
		}

		public function getIconAsset(pos : Number) : *
		{
			var iconSprite : Sprite = _baraban.getChildByName(pos.toString()) as Sprite;
			if (iconSprite)
			{
				var bitmap : Bitmap = iconSprite.getChildAt(0) as Bitmap;
				if (bitmap)
				{
					return bitmap.bitmapData;
				}
			}
			return null;
		}
	}
}
