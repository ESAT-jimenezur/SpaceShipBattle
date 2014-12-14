package {
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * 
	 * @author Jose Luis Jimenez Urbano
	 */
	public class Main extends Sprite {
		
		private var input:Input = new Input();
		private var update:Update = new Update();
		private var draw:Draw = new Draw();
		
		
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
			
			
			Misc.input = input;
			Misc.update = update;
			Misc.draw = draw;
			
			addChild(draw);
			
			update.addListeners();
		}
		
		private function mainLoop(e:Event):void {
			if (GameManager.getCurrentScene == "main_menu") {
				
			}else if (GameManager.getCurrentScene == "game") {
				//input.inputGame();
				update.updateGame();
				draw.drawGame();
			}
			
		}
		
		
		
		
	}
	
}