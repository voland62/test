package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author Design3d
	 */
	public class ToSlotButton extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_match_blue_normal.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_match_blue_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_match_blue_press.png", mimeType="image/png")]
		private static var DownClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_spin_passive.png", mimeType="image/png")]
		private static var OffClass : Class;
		// private var _w : Number;
		// private var _h : Number;
		private var _label : TextField;

		public function ToSlotButton()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();
			stateOFF = new OffClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;

			_label = createLabel();
			_label.x = 13;
			_label.y = 40;
			_label.text = "В СЛОТ";
			_label.mouseEnabled = false;
			addChild(_label);

			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 4;
			// filter.quality = 2;

			_label.filters = [filter];
		}

		private function createLabel() : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			tf.height = 30;
			tf.width = 80;
			// tf.border = true;
			tf.textColor = 0xf9fcbe;
			tf.selectable = false;

			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			format.size = 18;
			format.bold = true;
			tf.defaultTextFormat = format;

			return tf;
		}
	}
}
