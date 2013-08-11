package com.onlyplay.slotmatch3.components.games.elements
{
	import flash.display.DisplayObject;
	import alternativa.gui.base.GUIobject;

	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Design3d
	 */
	public class ProgressBarBase extends GUIobject
	{
		protected var _percent : Number = 0;
		protected var _maxValue : Number = 0;
		protected var _value : Number;
		protected var _tf : TextField;

		public function ProgressBarBase()
		{
			_tf = createLabel(10, 0xf9fcbe, true);
			addChild(_tf);
			
			applyFilter(_tf);
		}
		
		protected function applyFilter( tf:DisplayObject):void
		{
			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 4;
			// filter.quality = 2;
			tf.filters = [filter];
		}

		protected function createLabel(size:Number ,color:int, bold:Boolean) : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			// tf.border = true;
			tf.textColor = color;
			tf.selectable = false;
			tf.mouseEnabled = false;

			var format : TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			format.font = "_sans";
			format.size = size;
			format.bold = bold;
			tf.defaultTextFormat = format;

			return tf;
		}

		protected function setText() : void
		{
			var s : String = _value.toString() + " / " + _maxValue.toString();
			_tf.text = s;
		}

		public function get percent() : Number
		{
			return _percent;
		}

		public function set percent(value : Number) : void
		{
			_percent = value;
			draw();
			drawChildren();
		}

		public function get maxValue() : Number
		{
			return _maxValue;
		}

		public function set maxValue(maxValue : Number) : void
		{
			_maxValue = maxValue;
			percent = _value / _maxValue;
		}

		public function get value() : Number
		{
			return _value;
		}

		public function set value(value : Number) : void
		{
			_value = value;
			percent = _value / _maxValue;
		}
	}
}
