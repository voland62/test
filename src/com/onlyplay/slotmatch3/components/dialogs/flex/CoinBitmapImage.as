package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import spark.primitives.BitmapImage;

	/**
	 * @author Andrew
	 */
	public class CoinBitmapImage extends BitmapImage
	{
		[Embed(source="/Dialogs/RatingsDialog/ratings_by_money_norm.png")]
		private static const CoinClass : Class;

		public function CoinBitmapImage()
		{
			source = CoinClass;
		}
	}
}
