package com.onlyplay.slotmatch3.components.dialogs
{
	import alternativa.gui.base.GUIobject;
	import alternativa.gui.controls.Dummy;
	import com.onlyplay.slotmatch3.components.dialogs.panels.NeildPanel;
	import flash.display.DisplayObject;
	import alternativa.gui.container.linear.VBoxExpand;
	import alternativa.gui.mouse.resizableObject.ResizableObject;
	import alternativa.gui.controls.text.Label;
	import alternativa.gui.alternativagui;
	import alternativa.gui.container.linear.VBox;
	import alternativa.gui.enum.Align;
	import alternativa.gui.primitives.stretch.StretchBitmap;

	import assets.DialogClasses;

	import com.onlyplay.slotmatch3.components.dialogs.panels.RoundPanel4;
	import com.onlyplay.slotmatch3.components.dialogs.panels.RoundPanelBase;

	/**
	 * @author Andrew
	 */
	public class TimeIsOverDialog extends Dialog
	{
		private var _squareTable : GUIobject;
		private var _padding : Number = 20;
		private var _paddingTop : Number = 40;
		private var _vBox : VBox;
		private var _resiable : ResizableObject;
		public function TimeIsOverDialog()
		{
			alternativagui::_width = 390;
			alternativagui::_height = 450;
			

			
			//_vBox = new VBoxExpand(10);
			_vBox = new VBox(10);
			_vBox.align = Align.CENTER;
			
			var roundPanel :RoundPanelBase = new RoundPanel4();
			
			_vBox.addChild(roundPanel);
			
			
			var label:Label = new Label();
			label.text = "Он может быть ещё лучше";
			_vBox.addChild(label);
			
			_squareTable = new StretchBitmap(
								DialogClasses.tableBitmapData, 
								DialogClasses.tableCorner , 
								DialogClasses.tableCorner , 
								DialogClasses.tableCorner , 
								DialogClasses.tableCorner );
			//_squareTable.width = 300;
			_squareTable.height = 300;
			_squareTable.freezeHeight = true;
			//_squareTable = new NeildPanel();
			
			
			//_squareTable.height = 300;
			
			
			_vBox.addChild( _squareTable );
						
			super();
			
			_container.addChild(_vBox);
			
			
			_resiable = new ResizableObject();
			_resiable.border = 10;
			_resiable.resizableContainer = this;
			addChild(_resiable);
			_resiable.resize(alternativagui::_width, alternativagui::_height);
			
			
		}
		
		
		
		
		
		override protected function draw() : void
		{
			super.draw();
			
			_vBox.y = _paddingTop;
			_vBox.x = _padding;
			_vBox.width = alternativagui::_width - _padding - _padding;
			
			_vBox.height = alternativagui::_height - _padding - _paddingTop;
			
			
//			_squareTable.width = alternativagui::_width - _padding - _padding;
//			_squareTable.height =  200; //alternativagui::_width - _padding - _padding;
//			
//			_squareTable.x = _padding;
//			_squareTable.y = alternativagui::_height - _squareTable.height - _padding;
			
		}
	}
}
