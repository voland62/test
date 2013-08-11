package com.onlyplay.slotmatch3.components.games.elements
{
	import flash.display.DisplayObject;
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	/**
	 * @author Design3d
	 */
	public class BetButtonLeft extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/bn_bet_min_norm.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/bn_bet_min_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/bn_bet_min_press.png", mimeType="image/png")]
		private static var DownClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/bn_bet_min_passive.png", mimeType="image/png")]
		private static var OffClass : Class;
		
		
		private var _icon:DisplayObject;

		public function BetButtonLeft()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();
			stateOFF = new OffClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;
		}

		public function get icon() : DisplayObject
		{
			return _icon;
		}

		public function set icon(icon : DisplayObject) : void
		{
			_icon = icon;
		}
	}
}
