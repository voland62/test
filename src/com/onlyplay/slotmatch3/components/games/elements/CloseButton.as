package com.onlyplay.slotmatch3.components.games.elements
{
	import alternativa.gui.alternativagui;
	import alternativa.gui.controls.button.BaseButton;

	/**
	 * @author Design3d
	 */
	public class CloseButton extends BaseButton
	{
		[Embed(source="/Dialogs/Common/bn_close_red_norm.png", mimeType="image/png")]
		private static var NormalClass : Class;
		[Embed(source="/Dialogs/Common/bn_close_red_norm.png", mimeType="image/png")]
		private static var HoverClass : Class;
		[Embed(source="/Dialogs/Common/bn_close_red_press.png", mimeType="image/png")]
		private static var DownClass : Class;
		
		

		public function CloseButton ()
		{
			stateUP = new NormalClass();
			stateOVER = new HoverClass();
			stateDOWN = new DownClass();
			locked

			alternativagui::_height = _stateUP.height;
			alternativagui::_width = _stateUP.width;
		}
	}
}
