package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import spark.primitives.BitmapImage;

	/**
	 * @author Andrew
	 */
	public class CoinBitmapImage extends BitmapImage
	{
		[Embed(source="/Common/coin_with_shadow.png", mimeType="image/png")]
		private static const CoinClass : Class;

		public function CoinBitmapImage()
		{
			source = CoinClass;
		}
	}
}
