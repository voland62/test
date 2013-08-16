package com.onlyplay.slotmatch3.components.dialogs
{
	import assets.DialogClasses;
	import alternativa.gui.primitives.stretch.StretchBitmap;
	import alternativa.gui.alternativagui;
	import com.onlyplay.slotmatch3.components.dialogs.Dialog;

	/**
	 * @author Andrew
	 */
	public class TimeIsOverDialog extends Dialog
	{
		private var _squareTable : StretchBitmap;
		private var _padding:Number = 20;
		public function TimeIsOverDialog()
		{
			alternativagui::_width = 410;
			alternativagui::_height = 450;
			
			_squareTable = new StretchBitmap(
								DialogClasses.tableBitmapData, 
								DialogClasses.tableCorner , 
								DialogClasses.tableCorner , 
								DialogClasses.tableCorner , 
								DialogClasses.tableCorner );
			super();
			
			addChild(_squareTable);
			
		}
		
		
		
		override protected function draw() : void
		{
			super.draw();
			
			_squareTable.width = alternativagui::_width - _padding - _padding;
			_squareTable.height =  200; //alternativagui::_width - _padding - _padding;
			
			_squareTable.x = _padding;
			_squareTable.y = alternativagui::_height - _squareTable.height - _padding;
			
		}
	}
}
