package{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	/**
	 *
	 * @author Jose Luis Jimenez Urbano
	 */
	
	public final class Draw{
		
		public static function drawGame():void {
			drawBG();
			//drawStars();
			drawCursor(GameManager.getCurrentScene);
		}
		
		private static function drawBG() {
			
		}
		
		private static function drawCursor(cursor_type:String):void{
			if (cursor_type == "game"){
				Mouse.hide();	
			}
		}

	}
}