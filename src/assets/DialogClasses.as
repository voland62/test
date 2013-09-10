package assets
{
	import flash.geom.Rectangle;
	import flash.display.BitmapData;
	/**
	 * @author Andrew
	 */
	public class DialogClasses
	{
		
		// table 
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/panel1_base_glowed.png",  mimeType="image/png"
//				,scaleGridTop="30", scaleGridBottom="60", 
//                scaleGridLeft="30", scaleGridRight="36"
				)]
		public static const TableClass : Class;
		
		public static const tableBitmapData : BitmapData = new TableClass().bitmapData;
		public static const tableCorner:int = 30;
		//public static const tableShifts:Rectangle = new Rectangle( 14 );
		
		// dialog

		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/bg_border1.png", mimeType="image/png"
			,scaleGridTop="45", scaleGridBottom="120", 
			scaleGridLeft="24", scaleGridRight="30"
		)]
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
		
		
		
		// round panel1
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_38.png", mimeType="image/png")]
		public static const RoundPanelBorderClass_1 : Class;
		public static const roundPanelboderBitmap_1 : BitmapData = new RoundPanelBorderClass_1().bitmapData;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_38_mask.png", mimeType="image/png")]
		public static const RoundPanelMaskClass_1 : Class;
		public static const roundPanelMaskBitmap_1 : BitmapData = new RoundPanelMaskClass_1().bitmapData;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/tile_blue.png", mimeType="image/png")]
		public static const RoundPanelBgClass : Class;
		public static const roundPanelBgBitmap : BitmapData = new RoundPanelBgClass().bitmapData;
		
		public static const roundSettings:Settings = new Settings( 35, 85 );
		public static const roundShifts:Rectangle = new Rectangle( 0, 1, 0, 1 );
		
		// round panel2
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_54.png", mimeType="image/png")]
		public static const RoundPanelBorderClass_2 : Class;
		public static const roundPanelboderBitmap_2 : BitmapData = new RoundPanelBorderClass_2().bitmapData;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_54_mask.png", mimeType="image/png")]
		public static const RoundPanelMaskClass_2 : Class;
		public static const roundPanelMaskBitmap_2 : BitmapData = new RoundPanelMaskClass_2().bitmapData;
		
		public static const roundSettings2:Settings = new Settings( 45, 98 );
		public static const roundShifts2:Rectangle = new Rectangle( 0, 1, 0, 1 );
		
		// round panel3
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_75.png", mimeType="image/png")]
		public static const RoundPanelBorderClass_3: Class;
		public static const roundPanelboderBitmap_3 : BitmapData = new RoundPanelBorderClass_3().bitmapData;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_75_mask.png", mimeType="image/png")]
		public static const RoundPanelMaskClass_3: Class;
		public static const roundPanelMaskBitmap_3 : BitmapData = new RoundPanelMaskClass_3().bitmapData;
		
		public static const roundSettings3:Settings = new Settings( 50, 104 );
		public static const roundShifts3:Rectangle = new Rectangle( 0, 1, 0, 1 );
		
		// round panel4
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_90.png", mimeType="image/png")]
		public static const RoundPanelBorderClass_4: Class;
		public static const roundPanelboderBitmap_4 : BitmapData = new RoundPanelBorderClass_4().bitmapData;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_90_mask.png", mimeType="image/png")]
		public static const RoundPanelMaskClass_4: Class;
		public static const roundPanelMaskBitmap_4 : BitmapData = new RoundPanelMaskClass_4().bitmapData;
		
		public static const roundSettings4:Settings = new Settings( 62, 136 );
		public static const roundShifts4:Rectangle = new Rectangle( 0, 1, 0, 1 );
		
		// round panel5
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_135.png", mimeType="image/png")]
		public static const RoundPanelBorderClass_5: Class;
		public static const roundPanelboderBitmap_5 : BitmapData = new RoundPanelBorderClass_5().bitmapData;
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/Dialogs/Common/round_border_135_mask.png", mimeType="image/png")]
		public static const RoundPanelMaskClass_5: Class;
		public static const roundPanelMaskBitmap_5 : BitmapData = new RoundPanelMaskClass_5().bitmapData;
		
		public static const roundSettings5:Settings = new Settings( 80, 165 );
		public static const roundShifts5:Rectangle = new Rectangle( 0, 1, 0, 1 );
		
		
	}
	
	
}



