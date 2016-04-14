package 
{
	import flash.display.Bitmap;
	import flash.display3D.textures.Texture;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Japend
	 */
	public class Assets 
	{
		
		
			[Embed(source= "../media/pruebas/platform.png")]
			public static const platformPruebas:Class;
			
			[Embed(source = "../media/pruebas/guy.png")]
			public static const guyPruebas:Class;
			
			[Embed(source = "../media/pruebas/ball.png")]
			public static const ballPruebas:Class;
			
			private static var gameTextures:Dictionary = new Dictionary;
			
		public function Assets() 
		{	
		}
		
		public static function getTexture(name:String):starling.textures.Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = starling.textures.Texture.fromBitmap(bitmap);
			}
				
			return gameTextures[name];
		}
	
		
	}

}