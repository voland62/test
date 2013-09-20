package com.onlyplay.slotmatch3.components.lobby.elements.alternativa
{
	import alternativa.gui.alternativagui;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;

	import assets.AssetsStorage;

	import alternativa.gui.controls.Image;
	import alternativa.gui.base.GUIobject;
	import alternativa.gui.container.list.IItemRenderer;

	/**
	 * @author Andrew
	 */
	public class LobbyItemRenderer extends GUIobject implements IItemRenderer
	{
		private var _image : Image;
		protected var _data : Object;

		public function LobbyItemRenderer()
		{
			_image = new Image();
			alternativagui::_height = 400;	
			alternativagui::_width = 400;	
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
			// TODO: Auto-generated method stub
			return 0;
		}

		public function get data() : Object
		{
			// TODO: Auto-generated method stub
			return _data;
		}

		public function get selected() : Boolean
		{
			// TODO: Auto-generated method stub
			return null;
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
		}

		public function set data(value : Object) : void
		{
			log("LobbyItemRenderer.data(value)");
			if (value && value.url && !(_data && _data.url == value.url))
			{
				AssetsStorage.instance.getAsset(value.url, onLoad);
				log("trying loading");
			}
			_data = value;
		}

		private function onLoad(b : BitmapData) : void
		{
			var bmp : Bitmap = new Bitmap(b);
			addChild(bmp);
		}

		public function set selected(value : Boolean) : void
		{
		}
	}
}
