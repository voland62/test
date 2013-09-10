package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import assets.DialogClasses;

	/**
	 * @author Andrew
	 */
	public class RoundPanel4 extends RoundPanelBase
	{
		// protected var _minWidth:Number;
		public function RoundPanel4()
		{
			_bgBitmapData = DialogClasses.roundPanelBgBitmap;
			_frameBitmapData = DialogClasses.roundPanelboderBitmap_4;
			_maskBitmapData = DialogClasses.roundPanelMaskBitmap_4;
			_shiftRect = DialogClasses.roundShifts4;
			_settings = DialogClasses.roundSettings4;

			super();
		}
	}
}
