package com.onlyplay.slotmatch3.components.games.elements
{
	import flash.display.Bitmap;
	import alternativa.gui.alternativagui;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilter;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.DisplayObject;

	import alternativa.gui.controls.button.BaseButton;

	/**
	 * @author Design3d
	 */
	public class InfoButton extends BaseButton
	{
		[Embed(source="D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/SceneResources/ipad/Buttons/button_i_norm.png")]
		private static var NormalClass : Class;
//		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_spin_hover.png", mimeType="image/png")]
//		private static var HoverClass : Class;
		[Embed(source="/D:/reps/slogmatch3_2/trunk/client/ios/puzzleslots/SlotMatch3/Resources/SceneResources/ipad/Buttons/button_i_pass.png", mimeType="image/png")]
		private static var DownClass : Class;
//		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_spin_passive.png", mimeType="image/png")]
//		private static var OffClass : Class;
		//private var _w : Number;
		//private var _h : Number;
		//private var _label : TextField;

		public function InfoButton()
		{
			
			var size:Number = 23;
			
			var up:Bitmap = new NormalClass();
			up.smoothing = true;
			up.width = up.height = size;			
			stateUP = up;
			
			var over:Bitmap = new NormalClass();
			over.smoothing = true;
			over.width = over.height = size;
			stateOVER = over;
			
			var down:Bitmap =new DownClass();
			down.smoothing = true;
			down.width = down.height = size; 
			stateDOWN = down;
			//stateOFF = new OffClass();
			
			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;

//			_label = createLabel();
//			_label.x = 13;
//			_label.y = 40;
//			_label.text = "ИГРАТЬ!";
//			_label.mouseEnabled = false;
//			addChild(_label);
			
//			var filter:GlowFilter = new GlowFilter();
//			filter.color = 0;
//			filter.strength = 3;
//			filter.blurX = filter.blurY = 4;
			//filter.quality = 2;
			
			//_label.filters = [filter];
		}

//		private function createLabel() : TextField
//		{
//			var tf : TextField = new TextField();
//			tf.multiline = false;
//			tf.height = 30;
//			tf.width = 80;
//			//tf.border = true;
//			tf.textColor = 0xf9fcbe;
//			tf.selectable = false;
//			
//
//			var format : TextFormat = new TextFormat();
//			format.font = "_sans";
//			format.size = 18;
//			format.bold = true;
//			tf.defaultTextFormat = format;
//
//			return tf;
//		}
	}
}
