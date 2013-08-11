package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.controls.text.LabelTF;
	import alternativa.gui.enum.Align;
	import alternativa.gui.controls.text.Label;
	import flash.events.Event;
	import flash.display.Shape;
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.numericStepper.NumericStepper;
	
	use namespace alternativagui;

	/**
	 * @author Design3d
	 */
	public class BetStepper extends NumericStepper
	{
		
		//private var _labelTop:Label;
		private var _labelBottom:LabelTF;
		
		//private var _textBottom : String;
		
		public function BetStepper(minValue : Number = 0, maxValue : Number = 10, step : Number = 1, sign : int = 5)
		{
			super(minValue, maxValue, step, sign);
			
			var bg:Shape = new Shape();
			bg.graphics.lineStyle(1);
			bg.graphics.drawRect(0, 0, 100, 100);
			
			background = bg;
			
			textInput.color = 0x000000;
			textInput.labelAlign = Align.CENTER;
			//textInput.height = 40;
			
			_labelBottom = new LabelTF();
			//_labelBottom.s
			//_labelBottom.align = "center";
			//_labelBottom.
			_labelBottom.height = 20;
			//addChild(_labelBottom);
			

			decreaseButton = new BetButtonLeft();
			
			decreaseButton.name = "decreaseButton";
			
			
			var incBt:BetButtonRight = new BetButtonRight();
			incBt.icon = new Shape();
			
			increaseButton = new BetButtonRight();
			increaseButton.name = "increaseButton";
			space = 10;
			padding = 10;
			
			
			
			//textInput
			trace('textInput: ' + (textInput));

			alternativagui::_height = decreaseButton.height;
			alternativagui::_width = 300;
			
			addEventListener(Event.ADDED_TO_STAGE, onStage);

			
			
			draw();
			
		}
		
		private var _minWidth:Number = 40;
		private var _minHeight:Number = 10;
		override protected function calculateHeight(value : int) : int
		{
			return Math.max(value, _minHeight);
		}
			
		override protected function calculateWidth(value : int) : int
		{
			return Math.max(value, _minWidth);
		}
		
		
		override protected function draw() : void
		{
			super.draw();

			background.width = alternativagui::_width;
			background.height = alternativagui::_height;
			
			decreaseButton.x = 0;
			decreaseButton.y = 0;

			increaseButton.x = alternativagui::_width - increaseButton.width;
			increaseButton.y = 0;
			
//			textInput.x = 40;
//			textInput.tf.border = true;
//			textInput.width = alternativagui::_width - 100;
//			textInput.height = 40;

			_labelBottom.width = alternativagui::_width;
			//_labelBottom.y = alternativagui::_height - _labelBottom.height - 5;
			
		}
		

		private function onStage(e : Event) : void
		{
			_stage = stage;
		}

		public function get textBottom() : String
		{
			return _labelBottom.text;
		}

		public function set textBottom(textBottom : String) : void
		{
			_labelBottom.text = textBottom;
		}
	}
}
