package 
{
	import flixel.*;
	
	/**
	 * 
	 * @author Fernando Bevilacqua
	 */
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	public class Abandonauts extends FlxGame 
	{
		
		public function Abandonauts()
		{
			super(320, 240, PlayState, 2);
			
			// Enable debug functionality e.g. console. 
			FlxG.debug = true;
		}
	}
}