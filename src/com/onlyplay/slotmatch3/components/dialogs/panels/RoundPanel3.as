package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import assets.DialogClasses;

	/**
	 * @author Andrew
	 */
	public class RoundPanel3 extends RoundPanelBase
	{
		// protected var _minWidth:Number;
		public function RoundPanel3()
		{
			_bgBitmapData = DialogClasses.roundPanelBgBitmap;
			_frameBitmapData = DialogClasses.roundPanelboderBitmap_3;
			_maskBitmapData = DialogClasses.roundPanelMaskBitmap_3;
			_shiftRect = DialogClasses.roundShifts3;
			_settings = DialogClasses.roundSettings3;

			super();
		}
	}
}
