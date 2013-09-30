package com.onlyplay.slotmatch3.components.dialogs.flex.tite
{
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;

	/**
	 * @author Andrew
	 */
	public class Title extends SkinnableComponent
	{
		private var  _title : String;
		
		[SkinPart(required="true")]
		public var label : Label;

		public function get title() : String
		{
			return _title;
		}
		
		public function set title(title : String) : void
		{
			_title = title;
			log("setter");
		}
		
		
		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);
			if ( instance == label )
			{
				log("Title.partAdded(partName, instance)");
				label.text = _title;
			}
		}

		override protected function commitProperties() : void
		{
			super.commitProperties();
			if ( label.text != _title )
			{
				label.text = _title;
			}
		}

	}
}
