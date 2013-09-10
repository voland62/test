package com.onlyplay.slotmatch3.components.games.slot
{
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import flash.utils.Dictionary;
	import flash.display.DisplayObject;
	/**
	 * @author Andrew
	 */
	public class Icons
	{
		
		// private static var iconsMap : Dictionary;
		private static var queue : LoaderMax;
		
		public static function init( iconsMap:Dictionary ):void
		{
			queue = new LoaderMax();
			for (var id : * in iconsMap) 
			{
				var url:String = iconsMap[ id ];
				queue.append(new ImageLoader( url, {name:id.toString()}));		
			}
			queue.load();
			//Icons.iconsMap = iconsMap;
		}
		
		public static function  getAssetById(id : int) : DisplayObject
		{
			
			return (queue.getLoader( id.toString() ) as ImageLoader).content;
			//return queue.getContent( id.toString()  ); 
			//return LoaderMax.getContent(id.toString());
			
			//return iconsMap[ id ];
		}
	}
}
