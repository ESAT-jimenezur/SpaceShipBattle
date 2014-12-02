package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * 
	 * @author Jose Luis Jimenez Urbano
	 */
		
	public final class Update extends MovieClip {
		 
		
		public function updateGame():void {	
			
		}
		
		public function onMouseMove(e:MouseEvent):void {
			GameManager.mouse_pos_x  = e.stageX;
			GameManager.mouse_pos_y  = e.stageY;
		}
		
		public function addListeners():void {
			Misc._stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			Misc._stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyBoardKeyDown);
		}	 
		
		private function onKeyBoardKeyDown(e:KeyboardEvent):void {
			switch(String.fromCharCode(e.charCode)) {
				case 'w':
					GameManager.ship_pos_y += 5;
					break;
				case 'a':
					
					break;
				case 's':
					
					break;
				case 'd':
					break;
			}
			
		}
		}
	
}