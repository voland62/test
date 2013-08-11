package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.match.MatchComponent;

	import flash.display.Sprite;

	/**
	 * @author Andrew
	 */
	 
	 
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="640", height="480")] 
	public class TestMatch extends Sprite
	{
		public function TestMatch()
		{
			
			var match:MatchComponent= new MatchComponent();
			//match.init(6, 6, 0); 
			addChild( match );
			
		}
		
		
		
	}
}
