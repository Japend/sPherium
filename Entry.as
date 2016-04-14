package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Japend
	 */
	
	 [SWF(frameRate= "60", width= "800", height= "800", backgroundColor= "0x333333")] 
	public class Entry extends Sprite 
	{
		private var stats:Stats;
		private var myStarling:Starling;
		
		public function Entry() 
		{
			stats = new Stats();
			this.addChild(stats);
			
			myStarling = new Starling(Game, stage)
			myStarling.antiAliasing = 1;
			myStarling.start();
			
		}
		
	}
	
}