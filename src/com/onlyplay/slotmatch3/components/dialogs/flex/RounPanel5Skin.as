package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import com.onlyplay.slotmatch3.components.dialogs.flex.RoundPanelBaseSkin;

	/**
	 * @author Andrew
	 */
	public class RounPanel5Skin extends RoundPanelBaseSkin
	{
		[Embed(source="/Dialogs/Common/round_border_38.png", mimeType="image/png"
		,scaleGridTop='15', scaleGridBottom='16',
		scaleGridLeft='22', scaleGridRight='43'
		)]
		private static const _BorderClass : Class;
		[Embed(source="/Dialogs/Common/round_border_38_mask.png", mimeType="image/png"
		,scaleGridTop='15', scaleGridBottom='16',
		scaleGridLeft='22', scaleGridRight='43'
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
