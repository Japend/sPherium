package GameEntities 
{
	import starling.display.Image;
	import flash.events.Event;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Japend
	 */
	public class SpecialPlatform extends Sprite
	{
		private const VANISHING_FACTOR:Number = 1.3;
		
		//Platform-type variables/////
		private var img:Image;   
		private var vanishing:Boolean;
		private var period:Number;     //TIME BETWEEN DISAPPEARINGS
		private var vanishOnTouch:Boolean;
		private var movable:Boolean;
		private var passable:Boolean;    //IF THE PLAYER FALLS THROUGH IT
		
		//Moving variables///
		private var velocity:int;
		private var maxLimit:int;
		private var minLimit:int;
		private var moveInX:Boolean;
		private var _posX:Number;
		private var _posY:Number;
		private var previX:Number;
		private var previY:Number;
		private var tempX:Number;
		private var tempY:Number;
		private var _vx:Number;
		private var _vy:Number;
		private var factor:int;    ////TO MOVE IN ONE DIRECTION OR THE OTHER
		
		//Vanish Variables///
		private var disappearing:Boolean;
		private var appearing:Boolean;
		
		//Reference Time//
		private var previTime:Number;

		
		public function SpecialPlatform(X:int, Y:int, max:int = 0, min:int = 0, move:Boolean = false, axisX:Boolean = true,
				vanish:Boolean = false, period:Number = 3,vanishTouch:Boolean = false) 
		{
			super();
			
			this.x = X;
			this.y = Y;
			maxLimit = max;
			minLimit = min;
			movable = move;
			moveInX = axisX;
			vanishing = vanish;
			this.period = period;
			vanishOnTouch = vanishTouch;
			disappearing = false;
			vx = vy = 1;
			posX = this.x;
			posY = this.y;
			previX = this.x - 5;
			previY = this.y - 5;
			previTime = 0;
			
			img = new Image(Assets.getTexture("platformPruebas"));
			this.addChild(img);
			
		}
		
		
		
		/////////////////////////
		/////VANISHING CODE//////
		/////////////////////////
		
		////CONTROLS WHEN THE PLATFORM DISAPPEARS
		public function TimeVanish(newTime:Number):void
		{
			if (newTime - previTime >= period * 1000)
			{
				disappearing = true;
				if (disappearing)
					previTime = newTime;
			}
			
		}
		
		
		public function Vanish(newTime:Number):void
		{
			var difference:Number = newTime - previTime;
			var newAlpha:Number;
			previTime = newTime;
			trace(difference);
			
			newAlpha = img.alpha-(difference/1000 * VANISHING_FACTOR);
			
			if (!passable)
			{
				if (newAlpha <= 0.1)
					passable = true;
			}
			
			if (newAlpha <= 0.05)
			{
				newAlpha = -5;
				disappearing = false;
				appearing = true;
			}
			else
			{
				img.alpha = 0;
			}
			
			img.alpha = newAlpha;
		}
		
		public function Appearing(newTime:Number):void
		{
			var difference:Number = newTime - previTime;
			var newAlpha:Number;
			previTime = newTime;
			
			newAlpha = img.alpha+(difference/1000 * VANISHING_FACTOR);
			
			if (passable)
			{
				if (newAlpha >= 0.1)
					passable = false;
			}
			
			if (newAlpha >= 1)
			{
				img.alpha = 1;
				appearing = false;
			}
			else
			{
				img.alpha = newAlpha;
			}
			
		}
		
		
		public function Touched():void
		{
			if(vanishOnTouch)
				vanishing = true;
		}
		
		
		
		
		
		
		/////////////////////////
		/////MOVEMENT CODE///////
		/////////////////////////
		
		public function Move():void
		{
			
			///Cheks the direction in which the platform should move
			if (moveInX && this.x >= maxLimit)
				factor = -1;
			else
			{
				if (moveInX && this.x <= minLimit)
					factor = -1;
				else
				{
					if (this.y >= maxLimit)
						factor = -1;
					else
					{
						if (this.y <= minLimit)
							factor = 1;
							
						else
							factor = 1;
					}
				}
				
			}
			
	
			
			tempX = posX;
			tempY = posY;
			
			posX += vx * factor;
			posY += vy * factor;
			
			previX = tempX;
			previY = tempY;
			
			this.x =  posX;
			this.y = posY;
			
		}
		
		
		
		public function get vy():Number 
		{
			return _posY - previY;
		}
		
		public function set vy(value:Number):void 
		{
			previX = _posY - value;
		}
		
		public function get vx():Number 
		{
			return _posX - previX;
		}
		
		public function set vx(value:Number):void 
		{
			previX = _posX - value;
		}
		
		public function set posX(value:Number):void 
		{
			previX = value - vx;
			_posX = value;
		}
		
		
		public function get posX():Number 
		{
			return _posX;
		}
		
		public function set posY(value:Number):void 
		{
			previY = value - vy;
			_posY = value;
		}
		
		public function get posY():Number 
		{
			return _posY;
		}
		
		
		
		
		
		public function getDisappearing():Boolean 
		{
			return disappearing;
		}
		
		public function getMovable():Boolean 
		{
			return movable;
		}
		
		public function getAppearing():Boolean 
		{
			return appearing;
		}
		
		public function getPassable():Boolean
		{
			return passable;
		}
		
		public function getVanishOnTouch():Boolean
		{
			return vanishOnTouch;
		}
		
		
	}

}