package  
{
	import flixel.*;
	
	/**
	 * 
	 * 
	 * @author Fernando Bevilacqua
	 */
	public class Smoke extends FlxSprite
	{
		[Embed(source="../assets/smoke.png")]
		private var SMOKE_PNG :Class;
		
		public function Smoke() 
		{
			super(0, 0);
			loadGraphic(SMOKE_PNG, true, false, 6, 6);
			
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 10);
			addAnimationCallback(animCallback);
			
			// Move along the screen
			velocity.x = -Constants.SCREEN_MAX_VELOCITY * 4;
			acceleration.x = -Constants.SCREEN_ACCELERATION * 4;
			
			kill();
		}
		
		private function animCallback(name :String, frame :uint, index :uint) :void
		{
			if (name == "idle" && frame == 9) {
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