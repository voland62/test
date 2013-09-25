package com.smith.gallery.engine {
	
	
	import flash.display.*;
	import flash.events.*;
	
	
	import com.greensock.TweenLite
	
	public class SmtGallery extends Sprite{
		
		private const DISABLED:String = "disabled";
		private const ENABLED:String = "enabled";
		
		protected var _regionWidth:Number;
		protected var _regionHeight:Number;
		protected var _numOfVisible:uint;
		protected var _cellClass:Class;
		protected var _cellBg:DisplayObject;
		
		protected var platform:Sprite;
		protected var platform2:Sprite;
		protected var step:Number;
		
		private var _cellsPerStep:uint;
		private var _btnUp:DisplayObject;
		private var _btnDown:DisplayObject;
		
		private var state:String;
		private var btnUpEnable:Boolean;//активность кнопы btnUp
		private var btnDwnEnable:Boolean;//активность кнопы btnDown
		
		private var _dataProvider:Vector.<Object>=new Vector.<Object>();//данные, которые отображаются ячейками
		
		
		private var cursor:uint;
		
		public function SmtGallery( width:Number,
									height:Number,
									//direction:String,
									numVisible:uint,
								    cellsPerStep:uint,
								    cellClass:Class,
								    cellBg:DisplayObjectContainer=null ,
								    btnUp:DisplayObject = null,
								    btnDown:DisplayObject = null
								   ) {
									   
									  
			addEventListener(Event.REMOVED_FROM_STAGE, onRemove);
								  
			_regionWidth = width;//длина региона, в котором ячейки видны
			_regionHeight = height;//ширина региона, в котором ячейки видны
			_numOfVisible = numVisible;//колличество одновременно видимых элементов
			_cellsPerStep = Math.min (_numOfVisible, cellsPerStep);//количество ячеек, на которое передвигается картина за один ход
			
			_cellClass = cellClass;//класс обьекта ячейки (реализует ISmtGalleyItem)
			_cellBg = cellBg;//класс подложки ячек
			
			//кнопки промотки
			_btnUp = btnUp;//кнопка движения в одну сторону
			_btnDown = btnDown;//кнопка движения в другую сторону
			
			addEventListener(MouseEvent.MOUSE_WHEEL, onWheel)
			
			init();
		}
		
		
		//############### property   dataProvider ######################
		public function get dataProvider():Vector.<Object> {return _dataProvider};
		public function set dataProvider(value:Vector.<Object>):void {
			_dataProvider = value;
			DefineMainCells()
		};
		
		
		
		protected function init():void {
			//фон - нужен, чтобы на него подписать мышку
			graphics.beginFill(0x000000, 0);
			graphics.drawRect(0, 0, _regionWidth, _regionHeight);
			graphics.endFill();
			
			platform = new Sprite();//главная платформа
			addChild(platform);
			platform2 = new Sprite();
			addChild(platform2);//вспомогательная платформа
			platform2.visible = false;
			
			var mMask:Sprite = new Sprite();
			addChild(mMask)
			DrawMaskRect(mMask);
			platform.mask = mMask;
			
			var mMask2:Sprite = new Sprite();
			addChild(mMask2)
			DrawMaskRect(mMask2);
			platform2.mask = mMask2;
			
			//кнопка вперёд
			_btnDown.addEventListener(MouseEvent.CLICK, onClick)
			//кнопка назад
			_btnUp.addEventListener(MouseEvent.CLICK, onClick);
			
			cursor = 0;
			
			SetBtnsState();
			state = ENABLED
			
		}
		
		
		//рисует прямоугольник открываемый маской
		private function DrawMaskRect(msk:Sprite):void {
			msk.graphics.beginFill(0x000000, 1);
			msk.graphics.drawRect(0, 0, _regionWidth, _regionHeight);
			msk.graphics.endFill();
		}
		
		
		
		//обработчик нажатия на кнопы
		private function onClick(e:MouseEvent):void {
			if (state == DISABLED) return;
			DefineScrollParams(e.currentTarget == _btnDown ? -1 : 1);
		}
		
		//обработчик вращения колеса мышки
		private function onWheel(e:MouseEvent):void {
			if (e.delta > 0 && btnDwnEnable)DefineScrollParams(-1)
			if (e.delta < 0 && btnUpEnable)DefineScrollParams(1)
		}
		
		
		protected function DefineScrollParams(moveDir:int):Object {
			
			if (state != ENABLED) return{};//пока движение не закончено, нельзя заказывать новое
			state = DISABLED;
			
			var dir:int = moveDir;
			var realSteps:uint;
			
			realSteps = GetRealSteps(dir);//определяем величину сдвига, который реально можно сделать учитывая края
			PrepareMoving(dir, realSteps);//готовим вспомагательные ячейки
			
			cursor += realSteps * dir;
			dispatchEvent(new GalleryEvent(GalleryEvent.CURSOR_CHANGES,{newCursor:cursor},true))
			
			return { dir:dir, realSteps:realSteps };
			
		}
		
		
		//определяем величину сдвига, который реально можно сделать учитывая края
		private function GetRealSteps(dir:int):uint {
			var out:int;
			if (dir == 1) out = Math.min(_cellsPerStep, _dataProvider.length - _numOfVisible-cursor);
			if (dir == -1) out = Math.min(_cellsPerStep, cursor);
			return out;
		}
		
		
		//ставим вторую платформу относительно первой, и определяем содержимое её ячеек
		protected function PrepareMoving(dir:int, realSteps:int):void {
			
			var nextCursor:uint = cursor + _numOfVisible * dir;//курсор следующего (или предыдущего)окна
			
			for (var i:uint = 0; i < _numOfVisible ; i++) {
				var cur:int = nextCursor + i;
				if (cur < 0) continue;//при движении вправо  dir==-1
				
				if (cur > _dataProvider.length - 1) break; //при движении влево dir==1
				var item:* = _cellClass(platform2.getChildByName("cell_" + i));
				item.data = _dataProvider[cur];
			}
			
			platform2.visible = true;
			
		}
		
		
		//возвращаем основную платформу на исходную
		protected function tweenComplete():void {
			DefineMainCells();
			state = ENABLED;
			
			platform2.visible = false;
			SetBtnsState();
			
		}
		
		
		//устанавливаем видимость кнопок
		private function SetBtnsState():void {
			
			btnUpEnable = cursor < _dataProvider.length - _numOfVisible;
			btnDwnEnable = cursor > 0;
			
			_btnUp.visible = btnUpEnable;
			_btnDown.visible = btnDwnEnable;
			
			/*Sprite(_btnUp).mouseEnabled = btnUpEnable;
			Sprite(_btnDown).mouseEnabled = btnDwnEnable;
			
			MovieClip(_btnUp).gotoAndStop(btnUpEnable ? 1 : 2);
			MovieClip(_btnDown).gotoAndStop(btnDwnEnable ? 1 : 2);*/
			
			
		}
		
		//определяем содержимое ячеек основной платформы
		private function DefineMainCells():void {
			
			for (var i:uint = 0; i < _numOfVisible ; i++) {
				var cur:uint = cursor + i;
				var moreThenData:Boolean = cur > _dataProvider.length - 1;//флаг того, что курсор больше максимального индекса хранилища данных
				
				//ячейка видима, только если есть чем её заполнить
				platform.getChildByName("cell_" + i).visible = !moreThenData;
				
				if (moreThenData) continue;
				
				var item:* = _cellClass(platform.getChildByName("cell_" + i));
				item.data = _dataProvider[cur];
			}
			
			SetBtnsState();
		}
		
		
		private function onRemove(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemove);
			_btnDown.removeEventListener(MouseEvent.CLICK, onClick);
			_btnUp.removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(MouseEvent.MOUSE_WHEEL, onWheel)
		}
		
		
		
	}

}
