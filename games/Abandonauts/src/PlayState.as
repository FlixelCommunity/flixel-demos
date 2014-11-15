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
		private var batteries :FlxGroup;		// list of batteries
		
		private var smokes :FlxGroup;			// list of smoke particles
		private var jets :FlxGroup;				// list of jet particles
		
		private var batteryTimer :Number;		// a counter to control the addition of batteries to the screen.
		
		/**
		 * This method is called by Flixel to initialize the state.
		 * It's here that you should instantiate all your game elements and
		 * add them to the screen.
		 */
		override public function create():void 
		{
			var i:uint;
			
			// Initialize the group of obstacles, astronauts, batteries and smokes.
			// They will be empty until something is added using add().
			obstacles = new FlxGroup();
			astronauts = new FlxGroup();
			batteries = new FlxGroup();
			smokes = new FlxGroup();
			jets = new FlxGroup();

			// Create the obstacles, adding each one to the "obstacles" group.
			for (i = 0; i < Constants.MAX_OBSTACLES; i++) {
				var b:Obstacle = new Obstacle(i * 80, FlxG.height / 2);
				obstacles.add(b);
			}
			
			// Create the austronauts, adding each one to the "astronauts" group.
			for (i = 0; i < Constants.MAX_ASTRONAUTS; i++) {
				var a:Astronaut = new Astronaut();
				astronauts.add(a);
			}
			
			// Create the batteries, adding each one to the "batteries" group.
			for (i = 0; i < Constants.MAX_BATTERIES; i++) {
				var c:Battery = new Battery();
				batteries.add(c);
			}
			
			// Create the smokes, adding each one to the "smokes" group.
			for (i = 0; i < Constants.MAX_SMOKES; i++) {
				smokes.add(new Smoke());
			}
			
			// Create the jets, adding each one to the "jets" group.
			for (i = 0; i < Constants.MAX_JETS; i++) {
				jets.add(new Jet());
			}

			batteryTimer = Constants.BATTERY_ADD_INTERVAL;
			
			// Add all groups to the screen.
			// When Flixel finds a group in the display list, it will render
			// all its elements like they were added to the screen separately.
			add(obstacles);
			add(astronauts);
			add(batteries);
			add(smokes);
			add(jets);
		}
		
		/**
		 * This method is called everytime an astronaut touches a flying battery.
		 * 
		 * @param	astronaut 	the astronaut that touched the battery.
		 * @param	battery		the battery that was touched by the astronaut.
		 */
		private function onAstronautTouchesBattery(astronaut :Astronaut, battery :Battery) :void
		{
			astronaut.collectedBatteries++;
			battery.kill();
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
			
			// Check if any astronaut overlap any of the batteries. If that happen, the 
			// method "onAstronautTouchesBattery" will be invoked.
			FlxG.overlap(astronauts, batteries, onAstronautTouchesBattery);
			
			// Decrease the battery counter.
			batteryTimer -= FlxG.elapsed;
			
			// If the battery counter reached zero, it's time to add a new battery.
			if (batteryTimer <= 0) {
				var b:Battery = batteries.getFirstAvailable() as Battery;
				
				if (b != null) {
					b.reset(FlxG.width - 2, FlxG.random.float(10, FlxG.height * 0.9));
				}
				
				// Start counting again.
				batteryTimer = Constants.BATTERY_ADD_INTERVAL;
			}
		}
		
		// Getters
		public function get smokePool():FlxGroup { return smokes; }
		public function get jetPool():FlxGroup { return jets; }
	}
}