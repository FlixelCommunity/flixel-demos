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
		private var emitCounter :Number; 	// Controls the emission interval between one smoke particle and another
		
		public function Astronaut() 
		{
			super(FlxG.width * 0.2, 10);
			
			// Load the graphics to fill the astronaut.
			loadGraphic(ASTRO_PNG, true, false, 10, 10);
			
			// Create an animation named "running" composed of frames 0 to 8, played at 5 FPS.
			addAnimation("running", [0, 1, 2, 3, 4, 5, 6, 7, 8], 5);
			play("running");
			
			// Create a force pushing the astronaut down in the Y axis
			acceleration.y = 60;
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
			
			collectedBatteries = 0;
			emitCounter = 0;
		}

		private function emitSmoke():void {
			var smoke :Smoke;
			
			if (emitCounter > 0) return;
			
			smoke = (FlxG.state as PlayState).smokePool.getFirstAvailable() as Smoke;
			
			if (smoke != null) {
				smoke.reset(x - 5, y + FlxG.random.float(0, 5));
			}
		}
		
		private function emitJetFire():void {
			var jet :Jet;
			
			if (emitCounter > 0) return;
			
			jet = (FlxG.state as PlayState).jetPool.getFirstAvailable() as Jet;
			
			if (jet != null) {
				jet.reset(x, y + 1);
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			emitCounter -= FlxG.elapsed;
						
			if (FlxG.keys.Z) {
				velocity.y = -20;
				emitJetFire();
				emitSmoke();
			}
			
			if (emitCounter <= 0) {
				emitCounter = 0.15;
			}
		}
	}
}