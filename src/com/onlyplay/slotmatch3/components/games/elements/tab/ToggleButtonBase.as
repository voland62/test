package com.onlyplay.slotmatch3.components.games.elements.tab
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;
	import alternativa.gui.controls.button.ITriggerButton;
	import alternativa.gui.controls.button.RadioButtonGroup;
	import alternativa.gui.controls.button.TriggerButtonGroup;
	import alternativa.gui.controls.text.Label;

	import flash.filters.GlowFilter;
	import flash.text.engine.CFFHinting;
	import flash.text.engine.FontDescription;
	import flash.text.engine.FontLookup;

	/**
	 * 
	 * RU: обsчная кнопка, которая ведёт себя как radiobutton
	 * EN: big button -
	 * 
	 */
	public class ToggleButtonBase extends BaseButton implements ITriggerButton
	{
		// RU: флаг выделения
		// EN: flag of selection
		protected var _selected : Boolean = false;
		protected var _label : Label;
		// RU: группа, к которой принадлежит данная кнопка
		// EN: group of this button
		protected var _group : RadioButtonGroup;
		private var _lockedAlpha : Number = 0.7;

		public function ToggleButtonBase()
		{
			super();
		}

		override protected function draw() : void
		{
			super.draw();

			if (_label != null)
			{
				_label.x = (alternativagui::_width - int(_label.width)) >> 1 ;
				_label.y = ((alternativagui::_height - int(_label.height)) >> 1) - 1;
			}

			// if (_icon != null)
			// {
			// if (_label != null)
			// {
			// _icon.x = (_width - _icon.width - _label.width - _iconPadding) >> 1;
			// _label.x = _icon.x + int(_icon.width) + _iconPadding;
			// }
			// else
			// {
			// _icon.x = (_width - _icon.width) >> 1;
			// }
			// _icon.y = (_height - _icon.height) >> 1;
			// }
		}

		// RU: при выделении кнопки, сообщаем радиогруппе. Меняем состояния
		// EN: inform radiogroup on button selection. Change the state
		public function set selected(value : Boolean) : void
		{
			_selected = value;

			if (_group != null && _selected)
			{
				_group.buttonSelected(this);
			}
			if (_selected)
			{
				setState(_stateDOWN);
			}
			else
			{
				if (_over)
				{
					setState(_stateOVER);
				}
				else
				{
					setState(_stateUP);
				}
			}
		}

		public function get selected() : Boolean
		{
			return _selected;
		}

		// RU: задаем радогруппу для данной кнопки
		// EN: Set the radiogroup to this button
		public function set group(value : TriggerButtonGroup) : void
		{
			_group = value as RadioButtonGroup;
		}

		public function get group() : TriggerButtonGroup
		{
			return _group;
		}

		override public function set pressed(value : Boolean) : void
		{
			if (!_locked)
				_pressed = value;

			if (_pressed)
			{
				if (_group != null)
				{
					selected = true;
				}
				else
				{
					selected = !_selected;
				}
			}

			if (_label != null)
			{
				if (_pressed)
				{
					_label.y = ((alternativagui::_height - int(_label.height)) >> 1) + 1;
				}
				else
				{
					_label.y = (alternativagui::_height - int(_label.height)) >> 1;
				}
			}
		}

		override public function set over(value : Boolean) : void
		{
			if (!_locked)
			{
				_over = value;
			}

			if (!_locked && !_pressed)
			{
				if (!_selected)
				{
					setState(value ? _stateOVER : _stateUP);
				}
			}
			else if (!_locked && _pressed)
			{
				if (_over && _pressed)
				{
					if (_label != null)
					{
						_label.y = ((alternativagui::_height - int(_label.height)) >> 1) + 1;
					}
					// if (_icon != null)
					// {
					// _icon.y = ((_height - _icon.height) >> 1) + 1;
					// }
					setState(_stateDOWN);
				}
				else if (!_over && _pressed)
				{
					if (_label != null)
					{
						_label.y = ((alternativagui::_height - int(_label.height)) >> 1);
					}
					// if (_icon != null)
					// {
					// _icon.y = ((_height - _icon.height) >> 1);
					// }
					setState(_stateUP);
				}
			}
		}

		override public function set locked(value : Boolean) : void
		{
			super.locked = value;
			if (_locked)
			{
				if (_label != null)
				{
					_label.alpha = _lockedAlpha;
				}
				// if (_icon != null)
				// {
				// _icon.alpha = NumericConst.lockedAlpha;
				// }
			}
			else
			{
				if (_label != null)
				{
					_label.alpha = 1;
				}
				// if (_icon != null)
				// {
				// _icon.alpha = 1;
				// }
			}
		}

		// --- label ---------
		public function get label() : String
		{
			if (_label != null)
			{
				return _label.text;
			}
			else
			{
				return "";
			}
		}

		public function set label(value : String) : void
		{
			if (_label == null)
			{
				// TODO: вынести всю эту ктасоту на уровень выше в RoomTabButton

				Label.fontDescription = new FontDescription("_sans");
				Label.fontDescription.cffHinting = CFFHinting.HORIZONTAL_STEM;
				Label.fontDescription.fontLookup = FontLookup.DEVICE;

				_label = new Label();
				_label.size = 11;
				_label.color = 0xfef9bc;

				var filter : GlowFilter = new GlowFilter();
				filter.color = 0;
				filter.strength = 3;
				filter.blurX = filter.blurY = 3;
				// filter.quality = 2;

				_label.filters = [filter];
				

				addChild(_label);
			}
			if (value != null || value != "")
			{
				_label.text = value;
			}
			else
			{
				if (_label != null)
				{
					if (contains(_label))
					{
						removeChild(_label);
					}
					_label = null;
				}
			}
			draw();
		}
	}
}
