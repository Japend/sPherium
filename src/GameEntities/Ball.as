package GameEntities 
{
	import flash.display.InteractiveObject;
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	import starling.display.Image;
	import Math;
	import starling.utils.RectangleUtil;
	/**
	 * ...
	 * @author Japend
	 */
	public class Ball extends Sprite 
	{
		private const GRAVITY:Number = 0.015;
		private const FRICTION:Number = 0.99;
		private const BOUNCE_LOSS:Number = 0.6;
		private const IMPULSE:Number = 10;
		
		
		private var free:Boolean;
		private var player:int;
		private var _vx:Number;
		private var _vy:Number;
		private var img:Image;
		//private var onPlatform:Boolean;
		private var previTime:int;
		private var _landed:Boolean;
		
		public var rectNorth:Rectangle;
		public var rectSouth:Rectangle;
		private var rectWest:Rectangle;
		private var rectEast:Rectangle;
	
		
		public function Ball(X:int, Y:int) 
		{
			super();
			

			this.x = X;
			this.y = Y;
			free = true;
			player = 0;
			vx = 0;
			vy = 0;
			
			rectNorth = new Rectangle(0, 0, this.width, 10);
			rectSouth = new Rectangle(this.height - 10, 0, this.width, 10);
			rectEast = new Rectangle(this.width - 10, 0, 10, this.height);
			rectWest = new Rectangle(0, 0, 10, this.height);


			
			img = new Image(Assets.getTexture("ballPruebas"));

			//trace(this.x, this.y, this.height, this.width);
			//a = new Rectangle(10, 10, 0x00FF00);
			
			this.addChild(img);
		}
		
		public function Move(newTime:int):void
		{
			var difference:int = (newTime - previTime)/1000;
			
			this.x += Math.ceil(vx * difference);
			this.y += Math.ceil(vy * difference);
			
			vx = vx * FRICTION;
			
			if (!landed)
			{
			if(vy < 4)
				vy = vy + GRAVITY * difference;
			}
			
			rectNorth.x = this.x;
			rectNorth.y = this.y;
			rectSouth.x = this.x + this.height - 10;
			rectSouth.y = this.y;
			rectEast.x = this.x + this.width -10;
			rectEast.y = this.y;
			rectWest.x = this.x;
			rectWest.y = this.y;
			
		}
		
		public function BounceWall(direction:String, objectCoor:int):void
		{
			trace(objectCoor, this.y);
			switch(direction)
			{
				////DEPENDING ON THE DIRECTION IT'LL BOUNCE////
				case "NORTH":
					if (vy < 1.5)
					{
						vy = 0;
						landed = true;
					}
					else
					{
					vy = -vy;
					this.y = objectCoor -  this.height - 1;
					}
					break;
					
				case "SOUTH":
					vy = -vy;
					this.y = objectCoor + this.height + 1;
					break;
					
				case "WEST":
					vx = -vx;
					this.x = objectCoor - this.width -1;
					break;
					
				case "EAST":
					vx = -vx;
					this.x = objectCoor + this.width + 1;
					break;
					
				case "CORNER":
					vx = -vx;
					vy = -vy;
					break;
					
			}
		
			
			vx *= BOUNCE_LOSS;
			vy *= BOUNCE_LOSS;
			
			
		}
		
		public function BounceCharacter():void
		{
			vx *= 0.6;
			
			if (vy > 0.1)
				vy * 2;
			else
				vy += 5;
		}
		
		public function Launch(left:Boolean)
		{
			free = true;
			landed = false;
			vy = -1.5;
			vx = 5;
		}
		
		public function get vx():Number 
		{
			return _vx;
		}
		
		public function set vx(value:Number):void 
		{
			_vx = value;
		}
		
		public function get vy():Number 
		{
			return _vy;
		}
		
		public function set vy(value:Number):void 
		{
			_vy = value;
		}
		
		public function get landed():Boolean 
		{
			return _landed;
		}
		
		public function set landed(value:Boolean):void 
		{
			_landed = value;
		}
		
	}

}