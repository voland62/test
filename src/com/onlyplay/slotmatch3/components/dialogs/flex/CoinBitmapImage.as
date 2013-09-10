package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import spark.primitives.BitmapImage;

	/**
	 * @author Andrew
	 */
	public class CoinBitmapImage extends BitmapImage
	{
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Common/coin_with_shadow.png", mimeType="image/png")]
		private static const CoinClass : Class;

		public function CoinBitmapImage()
		{
			source = CoinClass;
		}
	}
}
