package  
{
	import flixel.*;
	import flixel.ui.FlxText;
	
	/**
	 * This is the class that has the game mechanic.
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class PlayState extends FlxState
	{
		
		override public function create():void 
		{
			super.create();
			
			add(new FlxText(0, 0, 200, "Hello world!"));
		}
	}
}