package {
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * 
	 * @author Jose Luis Jimenez Urbano
	 */
	public class Main extends Sprite {
		
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			Misc.setMain = this;
			var game_manager:GameManager = new GameManager();	
			
			
			// Set up main loop
			addEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		private function mainLoop(e:Event):void {
			if (GameManager.getCurrentScene == "main_menu") {
				
			}else if (GameManager.getCurrentScene == "game") {
				Input.inputGame();
				Update.updateGame();
				Draw.drawGame();
			}
			
		}
		
		
		
		
	}
	
}