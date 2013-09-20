package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import spark.components.TitleWindow;
	import spark.primitives.BitmapImage;

	/**
	 * @author Andrew
	 */
	[Style(name="titleBgSource", type="Object", inherit="no")]
	[Style(name="bgSource", type="Object", inherit="no")]
	public class GamePopup extends TitleWindow
	{
		[Embed(source="/Dialogs/Common/tile_skin.png", mimeType="image/png")]
		protected static var _BgClassDark : Class;
		[Embed(source="/Dialogs/Common/tile_paper.png", mimeType="image/png")]
		public static var _BgClassLight : Class;
		[Embed(source="/Dialogs/Common/title1_base.png", mimeType="image/png")]
		protected static var _TitleBgBigClass : Class;
		[SkinPart(required="true")]
		public var titleBg : BitmapImage;
		[SkinPart(required="true")]
		public var bgImage : BitmapImage;

		public function GamePopup()
		{
			setStyle("skinClass", DialogType1BasePopupSkin);

			var souceBase : String = "D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/";

			var defaultTitleImage : String = souceBase + "title2_base.png";
			setStyle("titleBgSource", defaultTitleImage);

			// var defaultBg : String = souceBase + "tile_paper.png";
			// var defaultBg :String = souceBase + "tile_skin.png";

			setStyle("bgSource", _BgClassLight);
		}

		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);

			if (instance == titleBg)
			{
				var s : Object = getStyle("titleBgSource");
				if (s)
				{
					titleBg.source = s;
				}
			}
			if (instance == bgImage)
			{
				var s : Object = getStyle("bgSource");
				trace('s: ' + (s));

				if (s)
				{
					bgImage.source = s;
				}
			}
		}
	}
}
