package assets
{
	import flash.display.Bitmap;
	/**
	 * @author Andrew
	 */
	public class BgClass
	{
		[Embed(source="/assets/facebook/facebook/id_6/id_6/background-ipadhd.png", mimeType="image/png")]
		private static const Clas : Class;
		
		private static var _instance:Bitmap;
		public function getClass():Class
		{
			return Clas;
		}
		
		public static function getSingletone():Bitmap
		{
			if (!_instance) _instance = new Clas();
			return _instance;
		}
	}
}
