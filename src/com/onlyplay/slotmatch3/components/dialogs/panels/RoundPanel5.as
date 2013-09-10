package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import assets.DialogClasses;

	/**
	 * @author Andrew
	 */
	public class RoundPanel5 extends RoundPanelBase
	{
		// protected var _minWidth:Number;
		public function RoundPanel5()
		{
			_bgBitmapData = DialogClasses.roundPanelBgBitmap;
			_frameBitmapData = DialogClasses.roundPanelboderBitmap_5;
			_maskBitmapData = DialogClasses.roundPanelMaskBitmap_5;
			_shiftRect = DialogClasses.roundShifts5;
			_settings = DialogClasses.roundSettings5;

			super();
		}
	}
}
