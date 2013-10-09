package com.smith.graph{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	
	public class  SmtGraphUtils  {
		
		public function SmtGraphUtils() {
		}
		
		//для растровых изображений
		public static function ResizeBitmap(cont:Bitmap, contW:Number, contH:Number,
											pic:BitmapData, dX:Number, dY:Number):void {
            //cont - контейнер, в который кладётся картинка
            //contW, contH -длина и ширина картинки которые нам нужны;
            //pic - непожатая картинка
			
			var normalPnt:Point = new Point(dX, dY);
			
			if (pic == null) pic = new BitmapData(1, 1, true);
			
			var ratio:Number = Math.min(contW/pic.width, contH/pic.height);

            cont.scaleX = ratio;
            cont.scaleY = ratio;

            var picWidth:Number = pic.width * ratio;
            var picHeight:Number = pic.height * ratio;

            cont.x = normalPnt.x;
            cont.y = normalPnt.y;

            if (picWidth < picHeight)cont.x +=(contW - picWidth)/2;
            if (picWidth > picHeight)cont.y +=(contH - picHeight)/2;
			
			
            cont.bitmapData = pic;
			cont.smoothing = true;
            cont.visible = true;
        }
		
		
		//для векторных изображений
		public static function ResizeVector(pic:DisplayObject, newW:Number, newH:Number):void{
			var ratioX:Number = newW / pic.width;
			var ratioY:Number = newH / pic.height;
			
			pic.scaleX = pic.scaleY = Math.min (ratioX, ratioY);
			
		}
		

	}

}