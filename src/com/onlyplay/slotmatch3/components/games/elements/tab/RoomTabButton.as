package com.onlyplay.slotmatch3.components.games.elements.tab
{
	import alternativa.gui.alternativagui;

	import flash.display.Bitmap;

	use namespace alternativagui;

	/**
	 *
	 * RU: Кнопка - вкладка для TabPanel
     * EN: Button-tab for TabPanel
	 *
	 */
	public class RoomTabButton extends ToggleButtonBase {
		
		
		[Embed(source="/assets/facebook/facebook/id_6/id_6/friend/tap_active.png", mimeType="image/png")]
		private static var ActiveClass : Class;
		private var activeBg:Bitmap = new ActiveClass();
		[Embed(source="/assets/facebook/facebook/id_6/id_6/friend/tap_pass.png", mimeType="image/png")]
		private static var PassiveClass : Class;
		private  var passiveBg : Bitmap = new PassiveClass();
		private var _buttomEdge : int = 8;
		private var _buttomTopOffset : int = 1;
		private var _buttomHorOffset : int = 2;
		private var _tabButtonHeight : int = 25;
		
		public function RoomTabButton() {
			// RU: задаем состояния кнопки
            // EN: set the button states
			stateDOWN = activeBg;
//			new RoomStretchBitmapOffset( passiveBg.bitmapData, 
//							_buttomEdge,
//							_buttomEdge, 
//							_buttomEdge, 
//							_buttomEdge, true, 
//							_buttomTopOffset, 
//							_buttomHorOffset, 
//							_buttomHorOffset
//							);
							
			stateOVER = passiveBg;
//			new RoomStretchBitmapOffset(
//							activeBg.bitmapData,
//							_buttomEdge,
//							_buttomEdge, 
//							_buttomEdge, 
//							_buttomEdge, true, 
//							_buttomTopOffset, 
//							_buttomHorOffset, 
//							_buttomHorOffset
//							);
							
			stateUP = passiveBg;
//			new RoomStretchBitmapOffset(
//							activeBg.bitmapData,
//							_buttomEdge,
//							_buttomEdge, 
//							_buttomEdge, 
//							_buttomEdge, true, 
//							_buttomTopOffset, 
//							_buttomHorOffset, 
//							_buttomHorOffset														
//							);

			// RU: задаем высоту кнопки
            // EN: ste the button height
            _width = passiveBg.width - 5;
			_height = _tabButtonHeight;
		}

		// RU: отдаем фикисированную высоту
        // EN: return the fixed height
		override protected function calculateHeight(value:int):int {
			return _height;
		}
		
		
		override protected function calculateWidth(value : int) : int
		{
			return _width;
		}
	}
}
