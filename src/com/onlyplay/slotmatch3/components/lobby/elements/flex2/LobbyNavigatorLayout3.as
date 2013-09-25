package com.onlyplay.slotmatch3.components.lobby.elements.flex2
{
	import com.greensock.TweenLite;
	import spark.layouts.HorizontalLayout;
	import spark.layouts.supportClasses.INavigatorLayout;

	import mx.core.IVisualElement;

	/**
	 * @author Andrew
	 */
	public class LobbyNavigatorLayout3 extends HorizontalLayout implements INavigatorLayout
	{
		public function LobbyNavigatorLayout3()
		{
		}
		
		
		private var _selectedElement:IVisualElement;
		public function get selectedElement() : IVisualElement
		{
			return  _selectedElement;
		}

		public function get selectedIndex() : int
		{
			return target.getElementIndex(_selectedElement);
		}

		public var ttt:Number = 0;
		
		public function set selectedIndex(value : int) : void
		{
			if (!target) return;
			var firstEl:IVisualElement = target.getElementAt(0);
			if (!firstEl) return;
			
			var shift:Number = (600 + gap) * value;
			
			TweenLite.to(this, 1, {ttt:shift, onUpdate:function ():void { 
				
				
				updateDisplayList(target.width, target.height);
				}} );
			
			_selectedElement = target.getElementAt(value);
			
		}
		
		
		override public function updateDisplayList(unscaledWidth : Number, unscaledHeight : Number) : void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			for (var i : int = 0; i < target.numElements; i++) 
			{
				var el:IVisualElement = target.getElementAt(i);
				el.setLayoutBoundsPosition(el.x - ttt, 0);
			}
		}
	}
}
