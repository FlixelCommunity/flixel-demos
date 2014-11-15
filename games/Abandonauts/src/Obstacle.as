package  
{
	import flixel.*;
	
	/**
	 * Represents the obstacles the astronauts have to overcome while running.
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Obstacle extends FlxSprite
	{
		[Embed(source="../assets/tiles.png")]
		private var TILES_PNG:Class;
		
		public function Obstacle(posX :Number, posY :Number) 
		{
			super(posX, posY);
			
			// Load graphics to fill the obstacle.
			loadGraphic(TILES_PNG, true, false, 80, 20);
			
			// Make obstacle don't move after a collision test. That way
			// the astronaut will not push the obstacle down when they touch each other.
			immovable = true;
			
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
			acceleration.x = -Constants.SCREEN_ACCELERATION;
		}
		
		private function spawn():void {
			x = FlxG.random.float(FlxG.width, FlxG.width + 100);
			y = FlxG.random.float(FlxG.height * 0.1, FlxG.height * 0.8);
			
			frame = FlxG.random.integer(0, 5);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (x + width <= 0) {
				spawn();
			}
		}
	}
}