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
		
		public function Obstacle(posX :Number, posY :Number) 
		{
			super(posX, posY);
			makeGraphic(100, 100, 0xff00ff00);
			
			// Make obstacle don't move after a collision test. That way
			// the astronaut will not push the obstacle down when they touch each other.
			immovable = true;
			
			maxVelocity.x = Constants.SCREEN_MAX_VELOCITY;
			acceleration.x = -Constants.SCREEN_ACCELERATION;
		}
		
		private function spawn():void {
			x = FlxG.width - 2;
			y = FlxG.random.float(FlxG.height / 2 - 40, FlxG.height / 2 + 40);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!onScreen()) {
				spawn();
			}
		}
	}
}