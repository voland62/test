package com.onlyplay.slotmatch3.components.games.elements.list
{
	import flash.text.TextFormatAlign;
	import alternativa.gui.alternativagui;
	import alternativa.gui.base.GUIobject;
	import alternativa.gui.container.list.IItemRenderer;

	import com.onlyplay.slotmatch3.components.games.elements.FrendProgress;

	import flash.display.Bitmap;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author Design3d
	 */
	public class RoomListItemRenderer extends GUIobject implements IItemRenderer
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/plashka_igroki_empty.png", mimeType="image/png")]
		private static var BGClass : Class;
		private var _bg : Bitmap;
		protected var _data : Object;
		protected var _selected : Boolean = false;
		protected var _itemIndex : int = 0;
		private var tf : TextField;
		private var frendProgress : FrendProgress;
		private var _levelTf : TextField;
		private var _winTf : TextField;
		private var _winAmountTf : TextField;

		public function RoomListItemRenderer()
		{
			_bg = new BGClass();
			addChild(_bg);

			alternativagui::_height = _bg.height;
			alternativagui::_width = _bg.width;

			tf = createLabel(11, 0xffffff, false, 60);
			addChild(tf);
			tf.x = 56;
			tf.y = 20;

			_winTf = createLabel(11, 0xf9fcbe, false, 54);
			addChild(_winTf);
			_winTf.text = "Выигрыш:";
			_winTf.x = 56;
			_winTf.y = 35;

			frendProgress = new FrendProgress();
			addChild(frendProgress);

			frendProgress.maxValue = 1000000;
			frendProgress.value = 1000000;
			frendProgress.y = 2;
			frendProgress.x = 7;

			_levelTf = createLabel(15, 0xffffff, true, 20);
			
			addChild(_levelTf);

			_levelTf.x = 3;
			_levelTf.y = 47;
			_levelTf.text = String(23);

			var filter : GlowFilter = new GlowFilter();
			filter.color = 0;
			filter.strength = 3;
			filter.blurX = filter.blurY = 3;
			// filter.quality = 2;

			_levelTf.filters = [filter];

			_winAmountTf = createLabel(12, 0x00ff00, true, 60);
			_winAmountTf.text = String(1002300);
			addChild(_winAmountTf);
			_winAmountTf.x = 56;
			_winAmountTf.y = 48;
			_winAmountTf.filters = [filter];
		}

		private function createLabel(size : Number, color : uint, bold : Boolean, w:Number) : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			tf.height = 20;
			tf.width = w;
			// tf.border = true;
			tf.textColor = color;
			tf.selectable = false;

			var format : TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			format.font = "_sans";
			format.size = size;
			format.bold = bold;
			tf.defaultTextFormat = format;

			return tf;
		}

		override protected function calculateHeight(value : int) : int
		{
			return alternativagui::_height;
		}

		override protected function calculateWidth(value : int) : int
		{
			// return super.calculateWidth(value);
			return alternativagui::_width;
		}

		public function get itemIndex() : int
		{
			return _itemIndex;
		}

		public function get data() : Object
		{
			return _data;
		}

		public function get selected() : Boolean
		{
			return _selected;
		}

		// public function get width() : Number
		// {
		//			//  TODO: Auto-generated method stub
		// return 0;
		// }
		//
		// public function get height() : Number
		// {
		//			//  TODO: Auto-generated method stub
		// return 0;
		// }
		public function set itemIndex(value : int) : void
		{
			_itemIndex = value;
		}

		public function set data(value : Object) : void
		{
			_data = value;
			var d : ServerRoomPlayerStateProtobuf = _data as ServerRoomPlayerStateProtobuf;

			if ( d )
			{
				tf.text = d.playerInfo.name;
				_winAmountTf.text = d.lastWin.toString();
				frendProgress.maxValue = d.targetProgress;
				frendProgress.value = d.progress;
				_levelTf.text = d.currentLevel;
				//targetProgress
				// _levelTf.text = d.playerInfo.
			}
		}

		public function set selected(value : Boolean) : void
		{
			_selected = value;
		}
	}
}
