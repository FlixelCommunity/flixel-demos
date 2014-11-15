package  
{
	import flixel.*;
	
	/**
	 * Represents an astronaut, the little guys running and jumping in the screen.
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Astronaut extends FlxSprite
	{
		
		public function Astronaut() 
		{
			super(FlxG.width * 0.2, 10);
			
			makeGraphic(20, 20, 0xffff0000);
			
			// Create a force pushing the astronaut down in the Y axis.
			acceleration.y = 40;
			
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
		}
		
		override public function update():void 
		{
			super.update();
						
			if (FlxG.keys.Z) {
				velocity.y = -20;
			}
			
			if (FlxG.keys.X) {
				velocity.y = -50;
			}
		}
	}
}