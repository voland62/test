package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.lobby_smith.LobbyView;
	import flash.display.Sprite;

	/**
	 * @author Andrew
	 */
	
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="640", height="600")] 
	public class TestSmithLobby extends Sprite
	{
		public function TestSmithLobby()
		{
			log("TestSmithLobby.TestSmithLobby()");
			
			var lobby:LobbyView = new LobbyView();
			addChild(lobby);
			
			
			
			
		}
	}
}
