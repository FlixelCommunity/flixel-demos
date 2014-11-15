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
			
			// Create a force pushing the astronaut down in the Y axis.
			acceleration.y = 40;
			
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
			acceleration.x = Constants.SCREEN_ACCELERATION;
		}
	}
}