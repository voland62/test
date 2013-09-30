package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import spark.components.Button;
	import spark.components.TitleWindow;
	import spark.primitives.BitmapImage;

	import com.onlyplay.slotmatch3.components.dialogs.flex.tite.Title;

	/**
	 * @author Andrew
	 */
	[Style(name="titleBgSkin", type="Object", inherit="yes")]
	[Style(name="closeBtSkin", type="Object", inherit="yes")]
	[Style(name="bgSource", type="Object", inherit="no")]
	public class GamePopup extends TitleWindow
	{
		[Bindable]
		[Embed(source="/Dialogs/Common/tile_skin.png", mimeType="image/png")]
		protected static var _BgClassDark : Class;
		[Bindable]
		[Embed(source="/Dialogs/Common/tile_paper.png", mimeType="image/png")]
		public static var _BgClassLight : Class;
		[Bindable]
		[Embed(source="/Dialogs/Common/title1_base.png", mimeType="image/png")]
		protected static var _TitleBgBigClass : Class;
		[Embed(source="/Dialogs/Common/title2_base.png")]
		protected static var _TitleBgBigClass2 : Class;
		
//		[SkinPart(required="true")]
//		public var titleBg : BitmapImage;

		[SkinPart(required="true")]
		public var titleComp : Title;
		
		[SkinPart(required="true")]
		public var bgImage : BitmapImage;
		
		

		public function GamePopup()
		{
			setStyle("skinClass", DialogType1BasePopupSkin);
			setStyle("bgSource", _BgClassLight);
			
		}

		override protected function partAdded(partName : String, instance : Object) : void
		{
			super.partAdded(partName, instance);
			
			if (instance == titleComp)
			{
				var s : Object = getStyle("titleBgSkin");
				if (s)
				{
					titleComp.setStyle("skinClass", s);
				}
				titleComp.title = title;
			}
			
			if (instance == bgImage)
			{
				var s : Object = getStyle("bgSource");
				//trace('s: ' + (s));

				if (s)
				{
					bgImage.source = s;
				}
			}
			
			if (instance == closeButton)
			{
				var s:Object = getStyle("closeBtSkin");
				if (s)
				{
					closeButton.setStyle("skinClass", s);
				}
			}
		}

		

	}
}
