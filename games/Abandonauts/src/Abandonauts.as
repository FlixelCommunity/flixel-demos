package 
{
	import flixel.*;
	
	/**
	 * This is the game entry point. From here Flixel is configured and started.
	 * 
	 * @author Fernando Bevilacqua
	 */
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	public class Abandonauts extends FlxGame 
	{
		public function Abandonauts()
		{
			// The first two parameters tell the size of the drawing buffer. It doesn't have to be
			// the same size of the screen, it can be smaller, but you have to inform Flixel to use
			// a zoom factor (4th parameter) to scale the drawing buffer to completely fill the screen.
			//			
			// In this game, the drawing buffer is 320x240 px (fist two params), using a zoom factor of 2 (4th param).
			// The result will be 320x240 * 2 = 640x480, which is the screen size. If you don't want the drawing buffer
			// to scale, just use zoom = 1 and set the drawing buffer size equals to the scren size.
			//
			// The 3rd parameter is the class Flixel will instantiate and jump to after it initializes itself. In this case,
			// that class is PlayState.
			super(320, 240, PlayState, 2);
			
			// Enable debug functionality e.g. console. 
			FlxG.debug = true;
		}
	}
}