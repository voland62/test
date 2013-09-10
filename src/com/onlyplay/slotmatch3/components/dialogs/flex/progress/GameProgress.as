package com.onlyplay.slotmatch3.components.dialogs.flex.progress
{
	import spark.components.ProgressBar;
	import spark.core.IDisplayText;

	/**
	 * @author Andrew
	 */
	public class GameProgress extends ProgressBar
	{
		[SkinPart(required="false")]
		public var levelDisplay : IDisplayText;
		
		private var _level:int;

		public function GameProgress()
		{
		}

		public function get level() : int
		{
			return _level;
		}

		public function set level(level : int) : void
		{
			if ( level != _level)
			{
				_level = level;
				invalidateProperties();
			}
		}
		
		
		override protected function commitProperties() : void
		{
			super.commitProperties();
			if ( levelDisplay )
			{
				levelDisplay.text = _level.toString();
			}
		}
		
		
		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);
			if ( instance == levelDisplay)
			{
				levelDisplay.text = _level.toString();
			}
		}
	}
}
