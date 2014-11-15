package  
{
	import flixel.*;
	
	/**
	 * 
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Background extends FlxGroup
	{
		[Embed(source="../assets/background.png")]
		private var BACKGROUN_PNG :Class;
		
		public function Background() 
		{
			add(new FlxSprite(0, 0, BACKGROUN_PNG));
		}
		
	}

}