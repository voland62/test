package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	/**
	 * @author Design3d
	 */
	public class SettingsButton extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/Id_1/bn_set_norm.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/Id_1/bn_set_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/Id_1/bn_set_press.png", mimeType="image/png")]
		private static var DownClass : Class;

		public function SettingsButton()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;
		}
	}
}
