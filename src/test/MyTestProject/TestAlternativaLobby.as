package test.MyTestProject
{
	import alternativa.gui.data.DataProvider;
	import alternativa.gui.layout.LayoutManager;
	import alternativa.init.GUI;

	import com.onlyplay.slotmatch3.components.lobby.elements.alternativa.LobbyList;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	/**
	 * @author Andrew
	 */
	 
	 
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="1200", height="1000")]
	public class TestAlternativaLobby extends Sprite
	{
		public function TestAlternativaLobby()
		{
			
			
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.stageFocusRect = false;

			this.mouseEnabled = false;
			this.tabEnabled = false;

			GUI.init(stage);

			LayoutManager.init(stage, [this]);
			
			log("TestAlternativaLobby.TestAlternativaLobby()");
			
			
			var lobbyList:LobbyList = new LobbyList();
			addChild(lobbyList);
			
			
			var vec : Vector.<Object> = new <Object> [
				{url:"/Map/Islands/Amazone/Background/amazone_island.png", label:"one"},
				{url:"/Map/Islands/Archipelago/Background/archipelago_island.png", label:"two"},
				{url:"/Map/Islands/Pirate/Background/pirate_island.png", label:"three"},
				{url:"/Map/Islands/Hawaii/Background/hawaii_island.png", label:"four"}
					];


			lobbyList.dataProvider = new DataProvider(vec);
			
			
		}
	}
}
