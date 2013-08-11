package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Andrew
	 */
	public class MaxBetButton extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_maxbet_normal.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_maxbet_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_maxbet_press.png", mimeType="image/png")]
		private static var DownClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_maxbet_passive.png", mimeType="image/png")]
		private static var OffClass : Class;
		private var _label1 : TextField;
		private var _label2 : TextField;

		public function MaxBetButton()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();
			stateOFF = new OffClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;

			_label1 = createLabel();
			_label1.x = 16;
			_label1.y = 9;
			_label1.text = "125 000";
			_label1.mouseEnabled = false;
			addChild(_label1);

			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 5;
			filter.blurX = filter.blurY = 2;
			filter.quality = 1;

			_label1.filters = [filter];

			_label2 = createLabel2();
			_label2.mouseEnabled = false;
			_label2.text = "Макс ставка";
			_label2.x = 18;
			_label2.y = 33;
			addChild(_label2);
			
			var filter2 : GlowFilter = new GlowFilter();
			filter2.color = 0xffff80;
			filter2.strength = 0.6;
			filter2.blurX = filter2.blurY = 2;
			filter2.quality = 2;
			_label2.filters = [filter2];
			
		}

		private function createLabel2() : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			tf.height = 20;
			tf.width = 80;
			// tf.border = true;
			tf.textColor = 0;
			tf.selectable = false;

			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			// format.font = "franklin2";
			// tf.embedFonts = true;
			format.align = TextFormatAlign.CENTER;
			format.size = 11;
			format.bold = true;
			tf.defaultTextFormat = format;

			return tf;
		}

		private function createLabel() : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			tf.height = 30;
			tf.width = 80;
			// tf.border = true;
			tf.textColor = 0xffffff;
			tf.selectable = false;

			var format : TextFormat = new TextFormat();
			//format.font = "_sans";
			format.font = "franklin2";
			tf.embedFonts = true;
			format.align = TextFormatAlign.CENTER;
			format.size = 19;
			format.bold = true;
			tf.defaultTextFormat = format;

			return tf;
		}
		
		public function set text (val:String):void
		{
			_label1.text = val;
		}
		
	}
}
