package  
{
	import flixel.FlxSprite;
	
	/**
	 * Represents an astronaut, the little guys running and jumping in the screen.
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Astronaut extends FlxSprite
	{
		
		public function Astronaut() 
		{
			makeGraphic(20, 20, 0xffff0000);
		}
	}
}