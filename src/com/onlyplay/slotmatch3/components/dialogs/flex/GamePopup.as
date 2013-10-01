package com.onlyplay.slotmatch3.components.dialogs.flex
{
	import spark.components.TitleWindow;
	import spark.primitives.BitmapImage;

	import com.onlyplay.slotmatch3.components.dialogs.flex.tite.Title;

	/**
	 * @author Andrew
	 */
	[Style(name="titleBgSkin", type="Class", inherit="yes")]
	[Style(name="closeBtSkin", type="Object", inherit="yes")]
	[Style(name="bgSource", type="Object", inherit="no")]
	public class GamePopup extends TitleWindow
	{
		
		[Embed(source="/Dialogs/Common/tile_brown.png")]
		protected static const _BgClassDark : Class;
		
		[Embed(source="/Dialogs/Common/tile_paper.png")]
		public static const _BgClassLight : Class;
		
		[Embed(source="/Dialogs/Common/title1_base.png")]
		protected static const _TitleBgBigClass : Class;
		[Embed(source="/Dialogs/Common/title2_base.png")]
		protected static const _TitleBgBigClass2 : Class;
		
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
