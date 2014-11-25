package  
{
	import flash.display.Sprite;
	/**
	 * @brief GameManager Singleton
	 * @author Jose Luis Jimenez Urbano
	 */
	public final class GameManager {
		// Use
		// var game_manager:GameManager = new GameManager();
		
		private static var _instance:GameManager;
		private var _main:*;
		
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
			
			return _instance;
		}
		
	}

}