package com.onlyplay.slotmatch3.components.lobby.elements.alternativa
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.container.list.List;
	import alternativa.gui.container.list.ListItemContainer;

	import com.onlyplay.slotmatch3.components.games.elements.scroller.SimpleScrollBar;

	import flash.display.Bitmap;

	/**
	 * @author Andrew
	 */
	public class LobbyList extends List
	{
		[Embed(source="/Lobby/Map/map_island_bg.png")]
		private static var BGClass : Class;
		private var _bg : Bitmap;

		public function LobbyList()
		{
			
			_bg = new BGClass();
			addChild(_bg);
			

			alternativagui::_width = _bg.width;
			alternativagui::_height = _bg.height;
			
			
			scrollBar = new SimpleScrollBar();
			container = new ListItemContainer();
			
			itemRenderer = LobbyItemRenderer;
			
			
			
		}
	}
}
