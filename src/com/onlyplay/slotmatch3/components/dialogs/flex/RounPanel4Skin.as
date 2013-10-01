package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import com.onlyplay.slotmatch3.components.dialogs.flex.RoundPanelBaseSkin;

	/**
	 * @author Andrew
	 */
	public class RounPanel4Skin extends RoundPanelBaseSkin
	{
		[Embed(source="/Dialogs/Common/round_border_135.png", mimeType="image/png"
		,scaleGridTop='50', scaleGridBottom='51',
		scaleGridLeft='67', scaleGridRight='68'
		)]
		private static const _BorderClass : Class;
		[Embed(source="/Dialogs/Common/round_border_135_mask.png", mimeType="image/png"
		,scaleGridTop='50', scaleGridBottom='51',
		scaleGridLeft='67', scaleGridRight='68'
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
