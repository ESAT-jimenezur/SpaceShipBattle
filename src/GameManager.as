package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * @brief GameManager Singleton
	 * @author Jose Luis Jimenez Urbano
	 */
	public final class GameManager {
		// Use
		// var game_manager:GameManager = new GameManager();
		
		private static var _instance:GameManager;
		private var _main:*;
		private var _current_scene:String; // main_menu - game
		public static var mouse_pos_x:Number = 0;
		public static var mouse_pos_y:Number = 0;
		public static var ship_pos_x:Number = 300;
		public static var ship_pos_y:Number = 400;
		
		//Debug
		private static var bg:Sprite;
		
		
		public function GameManager() {
			if(_instance){
				throw new Error("There is already a GameManager... Now Use GetGameManager()");
			} 
			_instance = this;
			init();
		}
		
		public static function GetGameManager():GameManager{
			if(!_instance){
				new GameManager();
			}
			return _instance;
		}
		
		
		public static function init():GameManager {
			//Set Background Color
			Misc.changeStageColor(000000); // -> Black
			_instance._current_scene = "game";
			return _instance;
		}
		
		// GameManager.getCurrentScene
		public static function get getCurrentScene():String {
			return _instance._current_scene;
		}
		
	}

}