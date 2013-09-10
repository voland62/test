package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import com.onlyplay.slotmatch3.components.dialogs.flex.RoundPanelBaseSkin;

	/**
	 * @author Andrew
	 */
	public class RounPanel1Skin extends RoundPanelBaseSkin
	{
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_54.png", mimeType="image/png"
		,scaleGridTop='26', scaleGridBottom='27',
		scaleGridLeft='40', scaleGridRight='60'
		)]
		private static const _BorderClass : Class;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_54_mask.png", mimeType="image/png"
		,scaleGridTop='26', scaleGridBottom='27',
		scaleGridLeft='40', scaleGridRight='60'
		)]
		private static const _MaskClass : Class;

		override protected function get borderClass() : Class
		{
			return _BorderClass;
		}

		override protected function get maskClass() : Class
		{
			return _MaskClass;
		}
	}
}
