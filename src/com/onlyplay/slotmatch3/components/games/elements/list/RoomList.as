package com.onlyplay.slotmatch3.components.games.elements.list
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.container.list.List;
	import alternativa.gui.container.list.ListItemContainer;

	import com.onlyplay.slotmatch3.components.games.elements.scroller.SimpleScrollBar;

	import flash.display.DisplayObject;
	import flash.display.Shape;

	use namespace alternativagui;
	
	public class RoomList extends alternativa.gui.container.list.List
	{
		private var _basePadding : int = 0;
		private var _borderThickness:int = 1;
		private static const _listMinWidth:int = 70;

		public function RoomList() {
			super();

			background = new Shape();

			_padding = _basePadding;

			_space = _basePadding;
			
			_scrollBarSpace = _basePadding;
			
			scrollBar = new SimpleScrollBar();

			container = new ListItemContainer();

			itemRenderer = RoomListItemRenderer;
		}

		override public function set itemRenderer(value:Class):void {

			container.itemRenderer = value;

			(scrollBar as SimpleScrollBar).mouseDelta = container.mouseDelta;
			// RU: сколько пикселей в одном шаге - нажатие на кнопку вверх/вниз у scrollBar
            // EN: how many pixels in a single step - click on scroll up / down button
			(scrollBar as SimpleScrollBar).stepScroll = container.stepScroll;
		}
		
		override protected function draw():void {
			super.draw();
			if (_container != null) {
				(_container as DisplayObject).x = (_container as DisplayObject).y = padding + _borderThickness;
				(_container as DisplayObject).height = _height - _padding * 2 - _borderThickness * 2;
				if (_scrollBar != null && _scrollBar.visible) {
					(_container as DisplayObject).width = _width - _padding - _scrollBar.width - _scrollBarSpace - _borderThickness;
				} else {
					(_container as DisplayObject).width = _width - _padding * 2 - _borderThickness * 2 ;
				}
			}
		}
		 
		override protected function calculateWidth(value:int):int {
			if (value < _listMinWidth)
				value = _listMinWidth;
			return value;
		}
	}
}
