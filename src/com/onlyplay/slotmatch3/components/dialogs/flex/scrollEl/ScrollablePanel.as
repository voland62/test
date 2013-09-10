package com.onlyplay.slotmatch3.components.dialogs.flex.scrollEl
{
	import spark.components.Group;
	import spark.components.SkinnableDataContainer;

	import com.onlyplay.slotmatch3.components.dialogs.flex.Title;

	import mx.core.IVisualElement;

	/**
	 * @author Andrew
	 */
	public class ScrollablePanel extends SkinnableDataContainer
	{
		private var _title : String;
		private var _bottomBar : IVisualElement;

		public function ScrollablePanel()
		{
			setStyle("skinClass", ScrollablePanelSkin);
		}

		[SkinPart(required="true")]
		public var bottomGroup : Group;
		[SkinPart(required="true")]
		public var titlePanel_ : Title;

		public function set bottomBar(el : IVisualElement) : void
		{
			
			_bottomBar = el;
			// invalidateDisplayList()
		}

		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);

			if ( instance == titlePanel_ )
			{
				titlePanel_.title = title;
			}
			if (instance == bottomGroup)
			{
				bottomGroup.removeAllElements();
				bottomGroup.addElement(_bottomBar);
			}
		}

		public function get title() : String
		{
			return _title;
		}

		public function set title(val : String) : void
		{
			_title = val;
		}

		override protected function commitProperties() : void
		{
			super.commitProperties();
			if ( titlePanel_.title != _title)
			{
				titlePanel_.title = _title;
			}
		}
	}
}
