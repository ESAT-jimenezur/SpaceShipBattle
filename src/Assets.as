package  
{
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 */
	public class Assets {
		
		//Backgrounds
		[Embed(source = "../assets/space_bg.jpg")] public static const space_bg:Class; 
		
		//Ships
		[Embed(source = "../assets/ship_pack_parts/ss_ship3.png")]public static const ss_ship3:Class;
		[Embed(source = "../assets/ship_pack_parts/ss_ship9.png")]public static const enemy_ship1:Class;
		
		//Fonts
		[Embed(source = "../assets/fonts/Audiowide-Regular.ttf",
			fontName = "audiowide", 
			mimeType = "application/x-font", 
			fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			advancedAntiAliasing="true"
		)]
        private var myEmbeddedFont:Class;
	}

}