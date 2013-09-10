package com.onlyplay.slotmatch3.components.games.slot
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author Design3d
	 */
	public class LineBage extends Sprite
	{
		[Embed(source="/assets/line_active.png", mimeType="image/png")]
		private static var ActiveClass : Class;
		[Embed(source="/assets/line_pass.png", mimeType="image/png")]
		private static var PassClass : Class;
		private var _activeSkin : Bitmap;
		private var _passiveSkin : Bitmap;
		private var id : int;
		
		private var _active:Boolean;

		public function LineBage( id:int )
		{
			this.id = id;
			_activeSkin = new ActiveClass();
			_passiveSkin = new PassClass();

			addChild(_passiveSkin);
			addChild(_activeSkin);
			_activeSkin.visible = false;
		}

		public function get active() : Boolean
		{
			return _active;
		}

		public function set active(val: Boolean) : void
		{
			_active = val;
			_passiveSkin.visible = !val;
			_activeSkin.visible = val;
		}
		
		
	}
}
