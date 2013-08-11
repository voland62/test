package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	/**
	 * @author Design3d
	 */
	public class PauseButton extends BaseButton
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/timer/bn_pause_norm.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/timer/bn_pause_hover.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/timer/bn_pause_press.png", mimeType="image/png")]
		private static var DownClass : Class;
		
		

		public function PauseButton()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;
		}
	}
}
