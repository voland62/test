package com.onlyplay.slotmatch3.components.dialogs
{
	import flash.events.MouseEvent;
	import alternativa.gui.alternativagui;
	import alternativa.gui.base.GUIobject;
	import alternativa.gui.primitives.stretch.StretchBitmap;
	import alternativa.gui.primitives.stretch.StretchRepeatBitmap;

	import assets.DialogClasses;

	import com.onlyplay.slotmatch3.components.games.elements.CloseButton;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Andrew
	 */
	public class Dialog extends GUIobject
	{
		private var _frame : StretchBitmap;
		private var _bg : StretchRepeatBitmap;
		private var _closeButton : DisplayObject;
		protected var _minWidth : Number = 400;
		protected var _minHeight : Number = 100;
		private var _titleBg : Bitmap;
		private var _titleTf : TextField;

		// private var _title:String;
		// "D:\reps\slogmatch3_2\trunk\client\ios\puzzleslots\SlotMatch3\Resources\Dialogs\Common\bg_border1.png"
		public function Dialog()
		{
			_bg = new StretchRepeatBitmap(DialogClasses.bgBitmapData, 1, 1, 1, 1);
			addChild(_bg);

			_frame = new StretchBitmap(DialogClasses.cornerBitmapData, DialogClasses.cornerLengthLeft, DialogClasses.cornerLengthRight, DialogClasses.cornerLengthRight, DialogClasses.cornerLengthLeft);
			addChild(_frame);
			// _frame.alpha = 0.6;

			_closeButton = new CloseButton();
			_closeButton.addEventListener(MouseEvent.CLICK, onCloseClick);
			addChild(_closeButton);

			_titleBg = new DialogClasses.TitleBgClass();
			addChild(_titleBg);

			_titleTf = createLabel(20, 0xfee5b8, true);
			addChild(_titleTf);
			applyFilter(_titleTf);

			alternativagui::_width = calculateWidth(alternativagui::_width);
			alternativagui::_height = calculateHeight(alternativagui::_height);

			draw();
		}

		private function onCloseClick(e : MouseEvent) : void
		{
			this.parent.removeChild(this);
		}

		protected function applyFilter(tf : DisplayObject) : void
		{
			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 4;
			// filter.quality = 2;
			tf.filters = [filter];
		}

		protected function createLabel(size : Number, color : int, bold : Boolean) : TextField
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

		override protected function draw() : void
		{
			use namespace alternativagui;

			super.draw();
			_frame.x = -DialogClasses.cornerShifts.x;
			_frame.y = -DialogClasses.cornerShifts.y;
			_frame.width = _width + DialogClasses.cornerShifts.x + DialogClasses.cornerShifts.width ;
			_frame.height = _height + DialogClasses.cornerShifts.y + DialogClasses.cornerShifts.height;

			_bg.x = _bg.y = 1;
			_bg.width = _width - 2;
			_bg.height = _height - 2;

			_closeButton.x = _width - ( _closeButton.width >> 1) - 11;
			_closeButton.y = - ( _closeButton.height >> 1 ) + 8;

			_titleBg.x = (_width - _titleBg.width) >> 1;
			_titleBg.y = -51;
			// (_title.height >> 1);
			
			_titleTf.width = _titleBg.width;
			
			_titleTf.x = (_width - _titleTf.width) >> 1;
			_titleTf.y = -8;
		}

		override protected function calculateWidth(value : int) : int
		{
			if (value < _minWidth)
			{
				return _minWidth;
			}
			else
			{
				return value;
			}
		}

		override protected function calculateHeight(value : int) : int
		{
			if (value < _minHeight)
			{
				return _minHeight;
			}
			else
			{
				return value;
			}
		}

		public function get title() : String
		{
			return _titleTf.text ;
		}

		public function set title(val : String) : void
		{
			_titleTf.text = val;
		}
	}
}
