package com.onlyplay.slotmatch3.components.lobby.elements.flex2
{
	import spark.skins.spark.RadioButtonSkin;
	import spark.components.Button;
	import spark.components.ButtonBar;
	import spark.components.DataNavigator;
	import spark.components.RadioButton;
	import spark.events.IndexChangeEvent;

	import mx.core.ClassFactory;

	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Andrew
	 */
	public class LobbyDataNavigator extends DataNavigator
	{
		[SkinPart(required="fasle")]
		public var upperButtons : ButtonBar;
		
		[SkinPart(required="fasle")]
		public var leftBt: Button;
		
		[SkinPart(required="fasle")]
		public var rightBt: Button;
		
		public function LobbyDataNavigator()
		{
			super();
			setStyle("skinClass", LobbyDataNavigatorSkin);
			// layout = new LobbyNavigatorLayout();
			//layout = new CarouselLayout();
			itemRenderer = new ClassFactory( LobbyItemRenderer );
			useVirtualLayout = false;
			// dataProvider.addEventListener(IndexChangeEvent.CHANGE, onIndexChange);
			//addEventListener(CollectionEvent.COLLECTION_CHANGE, onCollectionChanged);
			//addEventListener("change", onIndexChange);
			
		}
		
		
//		override public function set layout(value : LayoutBase) : void
//		{
//			super.layout = value;
//			layout.addEventListener("change", onLayoutChange);
//			
//		}

//		private function onLayoutChange(e : Event) : void
//		{
//			log("LobbyDataNavigator.onLayoutChange(e)");
//		}
//
//		private function onCollectionChanged(e : Event) : void
//		{
//			log("LobbyDataNavigator.onCollectionChanged(e)");
//		}

		private function onIndexChange(e: IndexChangeEvent) : void
		{
			log("LobbyDataNavigator.onIndexChange(e)");
			setButtonsState(e.newIndex);
		}
		
		private function setButtonsState( newIndex:int):void
		{
			rightBt.enabled = newIndex < dataProvider.length - 1;	
			leftBt.enabled = newIndex > 0;
		}
		
		
		
		
//		override public function set dataProvider(value : IList) : void
//		{
//			super.dataProvider = value;
//			upperButtons.dataProvider = value;
//		}
		
		
		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);
			
			if ( instance == upperButtons)
			{
				//upperButtons.firstButton = upperButtons.lastButton = upperButtons.middleButton = new ClassFactory( RadioButton );
				//upperButtons.itemRenderer = new ClassFactory(RadioButtonSkin);
				//upperButtons.addEventListener("change", onIndexChange);
				upperButtons.dataProvider = this;
				
			}
			
			if ( instance == leftBt)
			{
				leftBt.addEventListener(MouseEvent.CLICK, onLeftClick);
			}
			if ( instance == rightBt)
			{
				rightBt.addEventListener(MouseEvent.CLICK, onRightClick);
			}
		}

		private function onLeftClick(e : MouseEvent) : void
		{
			if ( selectedIndex > 0)
			{
				//selectedIndex--;
				upperButtons.selectedIndex--;
			}
		}

		private function onRightClick(e : MouseEvent) : void
		{
			if ( selectedIndex < dataProvider.length - 1)
			{
				//selectedIndex++;
				upperButtons.selectedIndex++;
				//upperButtons.selectedIndex = upperButtons.selectedIndex + 1;
				//upperButtons.invalidateProperties();
				//upperButtons.invalidateDisplayList();
				
			}
			

		}
		
	}
}
