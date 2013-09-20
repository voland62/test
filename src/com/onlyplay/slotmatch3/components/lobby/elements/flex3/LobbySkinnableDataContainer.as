package com.onlyplay.slotmatch3.components.lobby.elements.flex3
{
	import spark.components.ButtonBar;
	import spark.components.SkinnableDataContainer;

	import com.onlyplay.slotmatch3.components.lobby.elements.flex2.LobbyItemRenderer;

	import mx.core.ClassFactory;

	/**
	 * @author Andrew
	 */
	public class LobbySkinnableDataContainer extends SkinnableDataContainer
	{
		[SkinPart(required="fasle")]
		public var upperButtons : ButtonBar;

		public function LobbySkinnableDataContainer()
		{
			setStyle("skinClass", LobbySkinnableDataContainerSkin);
			itemRenderer = new ClassFactory(LobbyItemRenderer);
		}
		
		
		
		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);
			
			if ( instance == upperButtons )
			{
				upperButtons.dataProvider = dataProvider;
			}
		}
		
	}
}
