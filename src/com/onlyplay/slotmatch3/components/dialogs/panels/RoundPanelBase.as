package com.onlyplay.slotmatch3.components.dialogs.panels
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.base.GUIobject;
	import alternativa.gui.primitives.stretch.StretchBitmap;
	import alternativa.gui.primitives.stretch.StretchRepeatBitmap;
	import alternativa.gui.primitives.stretch.StretchRepeatHBitmap;

	import assets.DialogClasses;
	import assets.Settings;

	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	

	/**
	 * @author Andrew
	 */
	public class RoundPanelBase extends GUIobject
	{
		protected var _minWidth : Number ;
		protected var _minHeight : Number;
		protected var _bgBitmapData:BitmapData;
		protected var _frameBitmapData:BitmapData;
		protected var _maskBitmapData:BitmapData;
		protected var _shiftRect:Rectangle;
		private var _roundCorner : Number;//Rectangle;
		protected var _settings: Settings;
		
		
		private var _frame : DisplayObject;
		private var _mask : StretchRepeatHBitmap;
		private var _bg : DisplayObject;
		
		//private var _bgHolder:Sprite = new Sprite();

		public function RoundPanelBase()
		{
			//super();
			//addChild(_bgHolder);
			
//						_minWidth = 82;
//			_bgBitmapData = DialogClasses.roundPanelBgBitmap;
//			_maskBitmapData = DialogClasses.roundPanelMaskBitmap_1;
//			_frameBitmapData = DialogClasses.roundPanelboderBitmap_1;
//			_shiftRect = DialogClasses.roundShifts;
//			_roundCorner = DialogClasses.roundCorner;
			
			
			_roundCorner = _settings.corner;
			_minWidth = _settings.minWidth;
			
			_bg = new StretchRepeatBitmap( _bgBitmapData, 1, 1, 1, 1);
			//new DialogClasses.RoundPanelBgClass();//
			_bg.cacheAsBitmap = true;
			addChild(_bg);	
						
			_mask = new StretchRepeatHBitmap( _maskBitmapData, _roundCorner, _roundCorner);
			addChild(_mask);
			_mask.cacheAsBitmap = true;
			
			
			_bg.mask = _mask;
			
			//_frame = new StretchRepeatHBitmap(_frameBitmapData, _roundCorner, _roundCorner);
			_frame = new StretchBitmap(_frameBitmapData, _roundCorner, _roundCorner, 1, 1);
			addChild(_frame);
			
			//_minHeight = _frame.height - _shiftRect.y - _shiftRect.height;
			_minHeight =  _frameBitmapData.height - _shiftRect.y - _shiftRect.height;
			
			alternativagui::_width = calculateWidth(alternativagui::_width);
			alternativagui::_height = calculateHeight(alternativagui::_height);
			
			draw();
		}
		

		
		
		
		override protected function draw() : void
		{
			super.draw();
			_frame.y = _mask.y = -_shiftRect.y;
			_frame.width = alternativagui::_width;
			_mask.width = alternativagui::_width;
			_bg.width = alternativagui::_width;
			//log('alternativagui::_width: ' + (alternativagui::_width));
			_bg.height =  alternativagui::_height;
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

	}
}


