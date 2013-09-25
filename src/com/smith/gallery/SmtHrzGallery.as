package com.smith.gallery {
	
	
	import flash.display.*;
	import flash.events.*;
	
	import com.smith.gallery.engine.SmtGallery
	//import caurina.transitions.Tweener;
	import com.greensock.TweenLite;
	import com.greensock.easing.*
	
	public class SmtHrzGallery extends SmtGallery{
		
		public function SmtHrzGallery( width:Number,
									height:Number,
									//direction:String,
									numVisible:uint,
								    cellsPerStep:uint,
								    cellClass:Class,
								    cellBg:DisplayObjectContainer=null ,
								    btnUp:DisplayObject = null,
								    btnDown:DisplayObject = null
								   ) {
									   
			
			super(width, height, numVisible, cellsPerStep, cellClass, cellBg, btnUp, btnDown);
									   
		}
		
		
		override protected function init():void {
			
			super.init()
			
			
			//расстояние между ячейками
			var gapX:int = int((_regionWidth - _cellBg.width * _numOfVisible) / _numOfVisible);
			var gapY:int = int((_regionHeight - _cellBg.height)/2)
			//сдвиг, необходимый для обновления одной ячейки
			step = _cellBg.width + gapX;
				
			for (var j:uint = 0; j < 2;j++ ){		
				for (var i:uint = 0; i < _numOfVisible; i++) {
					
					//создаём обьект ячейки
					var cell:* = new _cellClass();
					cell.name = "cell_" + i;
					//даём ячейке фон	
					var bgClass:Class =  Object(_cellBg).constructor as Class;
					cell.bgrnd =  new bgClass()
					
					//располагаем ячейки
					cell.x = int(gapX / 2 + i * step)
					cell.y = int(gapY);
					
					//крепим ячейки на платформы	
					cell.clear()
					j ==0 ? platform.addChild(cell) : platform2.addChild(cell)
				}
			}
			
		}
		
		
		override protected function DefineScrollParams(moveDir:int):Object {
			
			var params:Object = super.DefineScrollParams(moveDir);
			
			var dir:int = params.dir;
			var realSteps:uint = params.realSteps;
			
			//Tweener.addTween(platform, { x:int(platform.x - dir * realSteps * step), time:.5, transition:"easeOutStrong", onComplete:tweenComplete } );
			//Tweener.addTween(platform2, { x:int(platform2.x - dir * realSteps * step), time:.5, transition:"easeOutStrong" } );
			
			TweenLite.to(platform, 0.5,  { x:int(platform.x - dir * realSteps * step),  ease:"easeOutStrong", onComplete:tweenComplete })
			TweenLite.to(platform2, 0.5, { x:int(platform2.x - dir * realSteps * step), ease:"easeOutStrong" } );
			
			return params;
		}
		
		//ставим вторую платформу относительно первой, и определяем содержимое её ячеек
		override protected function PrepareMoving(dir:int, realSteps:int):void {
			super.PrepareMoving(dir, realSteps)
			
			platform2.x = int(_regionWidth * dir) ;
			platform2.y = int(platform.y);
		}
		
		
		//возвращаем основную платформу на исходную
		override protected function tweenComplete():void {
			super.tweenComplete()
			platform.x = 0;
		}
		
	}

}
