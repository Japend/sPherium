package GameEntities 
{
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Japend
	 */
	public class Platform extends Sprite 
	{
		private var img:Image;
		private var _rect:Rectangle;
		
		public function Platform(X:int, Y:int) 
		{
			super();
			
			this.x = X;
			this.y = Y;
			
			img = new Image(Assets.getTexture("platformPruebas"));
			//rect = img.bounds;
			rect = new Rectangle(this.x, this.y, this.width, this.height);
			this.addChild(img);
		}
		
		public function get rect():Rectangle 
		{
			return _rect;
		}
		
		public function set rect(value:Rectangle):void 
		{
			_rect = value;
		}
		
	}

}