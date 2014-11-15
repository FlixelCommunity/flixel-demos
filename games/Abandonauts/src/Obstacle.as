package  
{
	import flixel.*;
	import flixel.tile.FlxTileblock;
	
	/**
	 * Represents the obstacles the astronauts have to overcome while running.
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Obstacle extends FlxTileblock
	{
		[Embed(source="../assets/crate2.png")]
		private var CRATE2_PNG:Class;
		
		public function Obstacle(posX :Number, posY :Number) 
		{
			super(posX, posY, 50, 10);
			
			// Load graphics to fill the obstacle.
			loadTiles(CRATE2_PNG);
			
			// Make obstacle don't move after a collision test. That way
			// the astronaut will not push the obstacle down when they touch each other.
			immovable = true;
			
			// Make obstacle move along the screen.
			moves = true;
			active = true;
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