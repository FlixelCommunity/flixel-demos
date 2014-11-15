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
		}
	}
}