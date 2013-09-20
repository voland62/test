package com.onlyplay.slotmatch3.components.lobby.elements.flex2
{
	import flash.geom.Rectangle;
	import spark.layouts.supportClasses.AnimationNavigatorLayoutBase;

	import mx.core.IVisualElement;

	/**
	 * @author Andrew
	 */
	public class LobbyNavigatorLayout extends AnimationNavigatorLayoutBase
	{
		
		
		
		public function LobbyNavigatorLayout()
		{
			super (AnimationNavigatorLayoutBase.DIRECT);
			//useVirtualLayout = false;
		}
		
		
		
		override public function updateDisplayList(unscaledWidth : Number, unscaledHeight : Number) : void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			update();
			//log("LobbyNavigatorLayout.updateDisplayList(unscaledWidth, unscaledHeight)");
		}
		
		
		override protected function updateDisplayListReal() : void
		{
			//log("LobbyNavigatorLayout.updateDisplayListReal()");
			super.updateDisplayListReal();
			
			//update();
		}
		
		
		override protected function updateDisplayListVirtual() : void
		{
			//log("LobbyNavigatorLayout.updateDisplayListVirtual()");
			super.updateDisplayListVirtual();
			//update();
			
		}
		
		
		override protected function updateDisplayListBetween() : void
		{
			//log("LobbyNavigatorLayout.updateDisplayListBetween()");
			super.updateDisplayListBetween();
		}
		
		private function update():void
		{
			
			
			var lastPos :Number = 0;
			//useVirtualLayout
			trace('useVirtualLayout: ' + (useVirtualLayout));
			//log(numElementsInLayout);
			//log(target.numElements);
			//log(numIndicesInView);
			
			var firstEl:IVisualElement = target.getElementAt(0);
			var selShift:Number = selectedIndex * firstEl.width;
			
			trace('firstIndexInView: ' + (firstIndexInView));
			log('lastIndexInView: ' + (lastIndexInView));
			
			for (var i : int = 0; i < numElementsInLayout; i++) 
			{
				//log("----LobbyNavigatorLayout.updateDisplayList(unscaledWidth, unscaledHeight)");
				
				var el:IVisualElement = target.getElementAt(i);
				//var el:IVisualElement = target.getVirtualElementAt(i);
				//var el:IVisualElement = elements[i];
				var b:Rectangle = getElementBounds( i );
				
				//log ( b );
				
				if (el)
				{
					//el.visible = true;
					var shift:Number = el.width * animationValue - selShift;
					el.setLayoutBoundsPosition(lastPos + shift, 0);
					
					trace('el.x: ' + (el.x));	
					//el.x = lastPos - shift;
					lastPos += el.width;
					//log( el );
				}
				
				//log("---");
						
			}
			
		}
		
	}
}
