package 
{
	import GameEntities.Ball;
	import GameEntities.Platform;
	import GameEntities.SpecialPlatform;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.getTimer;
	import starling.display.Quad;
	/**
	 * ...
	 * @author Japend
	 */
	public class Game extends Sprite 
	{
		private var platform:Platform;
		private var ball:Ball;
		private var rect1:Rectangle;
		private var rect2:Rectangle;
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			platform = new Platform(0, 0);
			ball = new Ball(0, 0);
			/*platform = new Image(Assets.getTextures("platformPruebas"));
			platform.x = 150;
			platform.y = 150;*/
			platform.x = 50;
			platform.y = 500;
			this.addChild(platform);
			ball.x = 30;
			this.addChild(ball);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			/*//platform.Move();
			if(!platform.getDisappearing())
				platform.TimeVanish(getTimer());
			
			if (platform.getDisappearing())
				platform.Vanish(getTimer());
			if (platform.getAppearing())
				platform.Appearing(getTimer());*/
			
				ball.Move(getTimer());
				if (ball.bounds.intersects(platform.bounds))
				{
					ball.BounceWall("NORTH", platform.y);
				}
				if (ball.landed)
				{
					ball.Launch(true);
				}
		}
		
	}

}