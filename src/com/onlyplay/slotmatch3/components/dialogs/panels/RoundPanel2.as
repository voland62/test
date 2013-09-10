package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import assets.DialogClasses;

	/**
	 * @author Andrew
	 */
	public class RoundPanel2 extends RoundPanelBase
	{
		//protected var _minWidth:Number;
		
		public function RoundPanel2()
		{
			_bgBitmapData = DialogClasses.roundPanelBgBitmap;
			_frameBitmapData = DialogClasses.roundPanelboderBitmap_2;
			_maskBitmapData = DialogClasses.roundPanelMaskBitmap_2;
			_shiftRect = DialogClasses.roundShifts2;
			_settings = DialogClasses.roundSettings2;
			
			super();
			
		}
		
		
	}
}
