package com.smith.gallery.engine {
	
	import com.smith.gallery.engine.ISmtGalleryItem
	
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import com.smith.gallery.SmtGalleryUtils;
	
	public class TestGalleyItem extends Sprite implements ISmtGalleryItem{
		
		private var bgLayer:Sprite;
		private var bmpLayer:Sprite;
		private var picW:uint=100;
		private var picH:uint=100;
		private var _data:Object;
		
		public function TestGalleyItem() {
			bgLayer =  new Sprite();
			addChildAt(bgLayer,0);
			
			bmpLayer = new Sprite();
			//bmpLayer.scaleX = 0.75;
			//bmpLayer.scaleY = 0.75;
			addChildAt(bmpLayer,1);
			
		}
		
		//############### property   bgrnd ######################
		public function set bgrnd(dObj:DisplayObject):void {
			while (bgLayer.numChildren > 0) {
				bgLayer.removeChildAt(0);
			}
			bgLayer.addChild(dObj);
		}
		
		
		//############### property   data ######################
		public function get data():Object {return _data};
		public function set data(value:Object):void {
			_data = value;
			Parse();
		};
		
		private function Parse():void {
			clear();
			//var bmpCont:Bitmap = new Bitmap( _data["bmd"])
			//SmtGalleryUtils.ResizeBitmap(bmpCont, picW, picH, bmpCont.bitmapData, new Point(5,5))
			//bmpLayer.addChild(bmpCont);
			
			//bgLayer.getChildAt(0)["label"].text = _data["txt"];
			
		}
		
		
		public function clear():void {
			/*while (bmpLayer.numChildren > 0) {
				var child:Bitmap = Bitmap(bmpLayer.getChildAt(0))
				bmpLayer.removeChildAt(0);
			}
			
			bgLayer.getChildAt(0)["label"].text = "";*/
			
		}
		
	}

}