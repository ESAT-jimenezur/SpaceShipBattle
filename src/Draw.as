package{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	/**
	 *
	 * @author Jose Luis Jimenez Urbano
	 */
	
	public final class Draw extends MovieClip {
		
		private var thumb_mc:MovieClip = new MovieClip();
		private var space_bg:Bitmap;
		private var space_ship:Bitmap;
		
		public function drawGame():void {
			//drawStars();
			
			drawCursor(GameManager.getCurrentScene);
			
			space_bg = new Assets.space_bg();
			space_ship = new Assets.ss_ship3();
			
			addChild(space_bg);
			addChild(space_ship);
			
			
			drawShip();
		}

		
		private function drawCursor(cursor_type:String):void{
			if (cursor_type == "game"){
				Mouse.hide();	
				//Draw a different cursor here
			}
		}
		
		private function drawShip():void {
			space_ship.x = GameManager.ship_pos_x;
			space_ship.y = GameManager.ship_pos_y;
			
			var dir = Math.atan2(space_ship.y - GameManager.mouse_pos_y,space_ship.x - GameManager.mouse_pos_x);
			space_ship.rotation = dir * 180 / Math.PI+180;
			
		}

	}
}