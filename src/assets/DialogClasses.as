package assets
{
	import flash.geom.Rectangle;
	import flash.display.BitmapData;
	/**
	 * @author Andrew
	 */
	public class DialogClasses
	{
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/bg_border1.png", mimeType="image/png")]
		public static const CornerClass : Class;
		public static const cornerBitmapData : BitmapData = new CornerClass().bitmapData;
		public static var cornerLengthLeft : int = 24;
		public static var cornerLengthRight: int = 45;
		public static var cornerShifts:Rectangle = new Rectangle(1, 12, 11, 5);
		
		
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/tile_paper.png", mimeType="image/png")]
		public static const BgClass : Class;
		public static const bgBitmapData : BitmapData = new BgClass().bitmapData;
		
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/title2_base.png", mimeType="image/png")]
		public static const TitleBgClass : Class;
		
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/panel1_base_glowed.png", mimeType="image/png")]
		public static const TableClass : Class;
		public static const tableBitmapData : BitmapData = new TableClass().bitmapData;
		public static const tableCorner:int = 30;
		//public static const tableShifts:Rectangle = new Rectangle( 14 );
	}
}
