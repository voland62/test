package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.controls.button.BaseButton;
	import alternativa.gui.alternativagui;

	

	/**
	 * @author Design3d
	 */
	public class PlusButton extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/Id_1/button_plus_money_norm.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/Id_1/button_plus_money_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/Id_1/button_plus_money_press.png", mimeType="image/png")]
		private static var DownClass : Class;

		public function PlusButton()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width; 
		}
	}
}
