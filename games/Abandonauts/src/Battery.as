package  
{
	import flixel.*;

	/**
	 * A class that represents a small rotating battery.
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Battery extends FlxSprite
	{
		[Embed(source="../assets/battery.png")]
		private var BATTERY_PNG:Class;
		
		public function Battery() 
		{
			super(0, 0);
			
			// Load graphics, create and play animation.
			loadGraphic(BATTERY_PNG, true, false, 10, 10);
			addAnimation("idle", [0, 1, 2, 3], 10);
			play("idle");
			
			// Batteries will be added to the screen after a while, so let's call
			// kill() here to make it deseapear from the screen when it is instantiated.
			kill();
			
			// Make the battery move along the scree.
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
			acceleration.x = -Constants.SCREEN_ACCELERATION;
		}
		
		override public function update():void 
		{
			if (!onScreen()) {
				kill();
			}
		}
	}
}