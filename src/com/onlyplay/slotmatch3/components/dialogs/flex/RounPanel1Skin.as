package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import com.onlyplay.slotmatch3.components.dialogs.flex.RoundPanelBaseSkin;

	/**
	 * @author Andrew
	 */
	public class RounPanel1Skin extends RoundPanelBaseSkin
	{
		[Embed(source="/Dialogs/Common/round_border_54.png", mimeType="image/png"
		,scaleGridTop='20', scaleGridBottom='21',
		scaleGridLeft='29', scaleGridRight='47'
		)]
		private static const _BorderClass : Class;
		[Embed(source="/Dialogs/Common/round_border_54_mask.png", mimeType="image/png"
		,scaleGridTop='20', scaleGridBottom='21',
		scaleGridLeft='29', scaleGridRight='47'
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
