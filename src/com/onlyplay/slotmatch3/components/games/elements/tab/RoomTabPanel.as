package com.onlyplay.slotmatch3.components.games.elements.tab
{
	import flash.display.Shape;
	import alternativa.gui.alternativagui;
	import alternativa.gui.container.linear.HBox;
	import alternativa.gui.container.tabPanel.TabData;
	import alternativa.gui.container.tabPanel.TabPanel;

	import flash.display.DisplayObject;

	use namespace alternativagui;

	/**
	 *
	 * RU: Панель с вкладками. Одна вкладка - контент.
	 * EN: Panel with tabs. One tab - content.
	 *
	 */
	public class RoomTabPanel extends TabPanel {

		// RU: горизонтальный контейнер для вкладок
		// EN: horizontal container for tabs
		protected var buttonHBox:HBox;

		// RU: фон
		// EN: background
		//protected var bg : RoomStretchBitmapOffset;
		private var _tabButtonSpace : int = -8;
		private var _basePadding : int = 0;
		private var _tabMinHeight : Number = 70;
		private var _bg : Shape;

		public function RoomTabPanel() {
			super();
			// RU: задаем фон
			// EN: set the background
			
			_bg = new Shape();
			//addChild(_bg);
			_bg.graphics.lineStyle(1);
			
			
			
//			bg = 
//			new RoomStretchBitmapOffset(
//					TabPanelSkin.contentBgBD, 
//					TabPanelSkin.bgEdge, 
//					TabPanelSkin.bgEdge, 
//					TabPanelSkin.bgEdge, 
//					TabPanelSkin.bgEdge, true, 
//					TabPanelSkin.bgTopOffset, 
//					TabPanelSkin.bgHorOffset, 
//					TabPanelSkin.bgHorOffset, 
//					TabPanelSkin.bgBottomOffset
//					);
//			addChild(bg);

			// RU: зазор между вкладками
			// EN: distance between tabs
			_tabSpace = _tabButtonSpace;//NumericConst.tabButtonSpace;

			// RU: внутренний отступ
			// EN: padding
			_padding = _basePadding;//NumericConst.basePadding;

			// RU: зазор между вкладкми и контентом
			// EN: distance between pads and container
			_space = 10;
			// RU: контейнер для вкладок
			// EN: tabs container
			buttonHBox = new HBox(_tabSpace);
			addChild(buttonHBox);
		}
		
		
//		override protected function changeContent(index : int) : void
//		{
//			//trace("RoomTabPanel.changeContent(index)");
//			trace('index: ' + (index));
//			super.changeContent(index);
//			
//			if ( index < buttonHBox.numChildren)
//			{
//				var tab :DisplayObject = buttonHBox.getChildAt(index);
//				//trace("slssls");
//				
//				
//				
//				buttonHBox.addChildAt(tab, buttonHBox.numChildren - 1);
//			}
//			
//			
//		}

		// RU: позиционируем и задаем размеры контенту, контейнеру вкладок и фону.
		// EN: set positions and sizes to content, tabs container and background
		override protected function draw():void {
			super.draw();
			use namespace alternativagui;
			
			// что делает resize?
			buttonHBox.resize(1,1);
			
//			bg.x = 0;
//			bg.y = buttonHBox.height + _space;
//			bg.width = _width;
//			bg.height = _height - buttonHBox.height - _space;

			//_bg.width = alternativagui::_width;
			//_bg.height = alternativagui::_height - buttonHBox.height - _space;
			
			
			_bg.graphics.clear();
			_bg.graphics.lineStyle(1);
			_bg.graphics.drawRect(0, 0, _width, _height);



			contentContainer.x = _padding;
			contentContainer.y = _padding;//buttonHBox.height + _space + _padding;
			contentContainer.width = _width - _padding * 2;
			contentContainer.height = _height - _padding * 2 - buttonHBox.height - _space;
			
			buttonHBox.x = 4;
			buttonHBox.y = contentContainer.y + contentContainer.height + _padding + _space;
		}
		
		


		// RU: Добавить вкладку
		// EN: add a tab
		override public function addTab(object:TabData):void {
			super.addTab(object);
			buttonHBox.addChild(object.button as DisplayObject);
			draw();
		}
		
		
		

		// RU: Добавить вкладку с контентом. Вкладка добавляется к указанной позиции индекса.
		// EN: Add tab with content. Tab is added to specified position of index.
		override public function addTabAt(object:TabData, index:int):void {
			super.addTabAt(object, index);
			buttonHBox.addChildAt(object.button as DisplayObject, index);
			draw();
		}

		// RU: Удалить вкладку с контентом.
		// EN: Remove tab with content
		override public function removeTab(object:TabData):void {
			var index:int = tabData.indexOf(object);
			if (index >= 0) {
				buttonHBox.removeChild(object.button as DisplayObject);
			}
			super.removeTab(object);
			draw();
		}

		// RU: Удалить вкладку с контентом из заданной позиции индекса.
		// EN: Remove tab with content from specified position of index.
		override public function removeTabAt(index:int):TabData {
			if (index >= 0 && index < tabData.length) {
				buttonHBox.removeChildAt(index);
			}
			return super.removeTabAt(index);
			draw();
		}

		// RU: смотрим значение ширины, если меньше заданного, отдаем минимальную ширину
		// EN: if width value is less than the specified value, then return minimal width value
		override protected function calculateWidth(value:int):int {
			if (buttonHBox.width != value) {
				buttonHBox.width = value;
			}
			contentContainer.width = value - _padding * 2;
			var w:int = buttonHBox.width < contentContainer.width ? contentContainer.width : buttonHBox.width;
			if (value < w)
				value = w;
			return value;
		}

		// RU: смотрим значение высоты, если меньше заданного, отдаем минимальную высоту
		// EN: if height value is less than the specified value, then return minimal height value
		override protected function calculateHeight(value:int):int {
			buttonHBox.height = 1;
			contentContainer.height = value - _padding * 2 - buttonHBox.height - _space;
			var h:int = buttonHBox.height + contentContainer.height + _space + _padding * 2;
			if (h < _tabMinHeight)
				h = _tabMinHeight;
			if (value < h)
				value = h;
			return value;
		}
	}
}
