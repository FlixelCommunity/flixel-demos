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
		[Embed(source="../assets/astro.png")]
		private var ASTRO_PNG :Class;
		
		public var collectedBatteries :int; // counts the amount of batteries this astronaut collected.
		private var smokeCounter :Number; 	// Controls the emission interval between one smoke particle and another
		
		public function Astronaut() 
		{
			super(FlxG.width * 0.2, 10);
			
			// Load the graphics to fill the astronaut.
			loadGraphic(ASTRO_PNG, true, false, 10, 10);
			
			// Create an animation named "running" composed of frames 0 to 8, played at 5 FPS.
			addAnimation("running", [0, 1, 2, 3, 4, 5, 6, 7, 8], 5);
			play("running");
			
			// Create a force pushing the astronaut down in the Y axis
			acceleration.y = 40;
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
			
			collectedBatteries = 0;
			smokeCounter = 0;
		}

		private function releaseSmoke():void {
			var smoke :Smoke;
			
			if (smokeCounter > 0) return;
			
			smoke = (FlxG.state as PlayState).smokePool.getFirstAvailable() as Smoke;
			
			if (smoke != null) {
				smoke.reset(x - 3, y + FlxG.random.float(0, 5));
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			smokeCounter -= FlxG.elapsed;
						
			if (FlxG.keys.Z) {
				velocity.y = -10;
				releaseSmoke();
			}
			
			if (FlxG.keys.X) {
				velocity.y = -50;
				releaseSmoke();
			}
			
			if (smokeCounter <= 0) {
				smokeCounter = 0.15;
			}
		}
	}
}