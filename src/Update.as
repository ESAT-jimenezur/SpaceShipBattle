package {
	import flash.display.MovieClip;
	import flash.events.Event;
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
		}	 
	}
}