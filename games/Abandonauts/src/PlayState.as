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
		private var obstacles :FlxGroup; 		// list of obstacles
		private var astronauts :FlxGroup;		// list of astronauts
		
		/**
		 * This method is called by Flixel to initialize the state.
		 * It's here that you should instantiate all your game elements and
		 * add them to the screen.
		 */
		override public function create():void 
		{
			var i:uint;
			
			// Initialize the group of obstacles and astronauts.
			// They will be empty until something is added using add().
			obstacles = new FlxGroup();
			astronauts = new FlxGroup();

			// Create the obstacles, adding each one to the "obstacles" group.
			for (i = 0; i < Constants.MAX_OBSTACLES; i++) {
				var b:Obstacle = new Obstacle(i * 100, FlxG.height / 2);
				obstacles.add(b);
			}
			
			// Create the austronauts, adding each one to the "astronauts" group.
			for (i = 0; i < Constants.MAX_ASTRONAUTS; i++) {
				var a:Astronaut = new Astronaut();
				astronauts.add(a);
			}

			// Add both groups obstacles and astronauts to the screen.
			// When Flixel finds a group in the display list, it will render
			// all its elements like they were added to the screen separately.
			add(obstacles);
			add(astronauts);
		}
		
		/**
		 * This method is called by Flixel every game update. Usually the game logic
		 * (what collides with what, etc) is placed here.
		 */
		override public function update():void 
		{
			// Call Flixel original update method, otherwise everything will stop working.
			super.update();
			
			// Make astronauts and obstacles collide, so they will not move through each other.
			FlxG.collide(astronauts, obstacles);
		}
	}
}