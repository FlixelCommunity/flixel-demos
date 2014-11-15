package  
{
	import flixel.*;
	
	/**
	 * 
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Jet extends FlxSprite
	{
		[Embed(source="../assets/jet.png")]
		private var JET_PNG :Class;
		
		public function Jet() 
		{
			super(0, 0);
			loadGraphic(JET_PNG, true, false, 4, 4);
			
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7], 15);
			addAnimationCallback(animCallback);
			
			// Move along the screen
			velocity.x = -Constants.SCREEN_MAX_VELOCITY * 4;
			acceleration.x = -Constants.SCREEN_ACCELERATION * 4;
			
			kill();
		}
		
		private function animCallback(name :String, frame :uint, index :uint) :void
		{
			if (name == "idle" && frame == 7) {
				kill();
			}
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			play("idle");
		}
	}
}