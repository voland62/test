package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import assets.DialogClasses;

	/**
	 * @author Andrew
	 */
	public class RoundPanel1 extends RoundPanelBase
	{
		// protected var _minWidth:Number;
		public function RoundPanel1()
		{
			_bgBitmapData = DialogClasses.roundPanelBgBitmap;
			_maskBitmapData = DialogClasses.roundPanelMaskBitmap_1;
			_frameBitmapData = DialogClasses.roundPanelboderBitmap_1;
			_shiftRect = DialogClasses.roundShifts;
			_settings = DialogClasses.roundSettings;

			super();
		}
	}
}
