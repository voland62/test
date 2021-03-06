package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Design3d
	 */
	public class MapButton extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_map_norm.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_map_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_map_press.png", mimeType="image/png")]
		private static var DownClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/button_map_pass.png", mimeType="image/png")]
		private static var OffClass : Class;
		private var _label : TextField;

		public function MapButton()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();
			stateOFF = new OffClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;

			_label = createLabel();
			_label.x = 22;
			_label.y = 13;
			_label.text = "Вернуться к карте";
			_label.mouseEnabled = false;
			addChild(_label);

			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 4;
			filter.blurX = filter.blurY = 2;
			// filter.quality = 2;

			_label.filters = [filter];
		}

		private function createLabel() : TextField
		{
			var tf : TextField = new TextField();

			tf.multiline = false;
			tf.height = 30;
			tf.width = 65;
			// tf.border = true;
			tf.textColor = 0xf9fcbe;
			tf.selectable = false;
			tf.wordWrap = true;
			tf.autoSize = TextFieldAutoSize.CENTER;

			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			format.size = 11;
			format.align = TextFormatAlign.CENTER;
			// format.letterSpacing = 1;
			format.bold = true;
			tf.defaultTextFormat = format;

			return tf;
		}
	}
}
