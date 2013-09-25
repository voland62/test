package
{
    import bmfontrenderer.BMFont;
    
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.utils.ByteArray;
        
    [SWF(backgroundColor="0x1234567")]
    public class BMFontRenderer extends Sprite
    {
        [Embed(source="arial_32.fnt", mimeType="application/octet-stream")]
        public var fontData:Class;
		
 
        [Embed(source="arial_32.png")]
        public var fontSheet:Class;
		
        [Embed(source="nums.fnt", mimeType="application/octet-stream")]
        public var numsFontData:Class;
		
        [Embed(source="nums_0.png")]
        public var numsSheet:Class;


 
        public function BMFontRenderer()
        {
            // Don't scale.
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            // Get the font data and pass it to the BMFont.
//            var fontBits:ByteArray = new fontData();
//            var font:String = fontBits.readUTFBytes(fontBits.length);
//			
//			
//			
//            
//            var bmfont:BMFont = new BMFont();
//            bmfont.parseFont(font);
//            
//            trace("Parsed " + bmfont.glyphMap.length + " glyphs");
//            
//            bmfont.addSheet(0, new fontSheet().bitmapData);
//            //bmfont.addSheet(0, new numsSheet().bitmapData);
//            //
//            // OK, draw some fonts!
//            var out:BitmapData = new BitmapData(200, 100, true, 0x0);
//            bmfont.drawString(out, 0, 0, "10Hello, world!");
//            
//            var outb:Bitmap = new Bitmap(out);
//            addChild(outb);
			
			// ----------------------------------------------
			var numsBits:ByteArray = new numsFontData(); 
			var numFont:String = numsBits.readUTFBytes( numsBits.length );
			//trace( numFont );
			var numBmFont:BMFont = new BMFont();
			
			numBmFont.parseFont(numFont);
			trace ("numBmFont.glyphMap.length:" + numBmFont.glyphMap.length);
			numBmFont.addSheet( 0, new numsSheet().bitmapData );
			//numBmFont.addSheet( 0, new fontSheet().bitmapData );
			//numBmFont.a
			
			var out2:BitmapData = new BitmapData(400, 250,true, 0xff00ff);
			numBmFont.drawString(out2, 1, 1, "01");
			
            var outb2:Bitmap = new Bitmap(out2);
			//var outb2:Bitmap = new Bitmap( new numsSheet().bitmapData as BitmapData );
			outb2.y = 100;
            addChild(outb2);
        }
    }
}