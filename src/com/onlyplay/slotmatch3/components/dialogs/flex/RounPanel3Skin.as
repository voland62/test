package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import com.onlyplay.slotmatch3.components.dialogs.flex.RoundPanelBaseSkin;

	/**
	 * @author Andrew
	 */
	public class RounPanel3Skin extends RoundPanelBaseSkin
	{
		[Embed(source="/Dialogs/Common/round_border_90.png", mimeType="image/png"
		,scaleGridTop='45', scaleGridBottom='46',
		scaleGridLeft='58', scaleGridRight='80'
		)]
		private static const _BorderClass : Class;
		[Embed(source="/Dialogs/Common/round_border_90_mask.png", mimeType="image/png"
		,scaleGridTop='45', scaleGridBottom='46',
		scaleGridLeft='58', scaleGridRight='80'
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
