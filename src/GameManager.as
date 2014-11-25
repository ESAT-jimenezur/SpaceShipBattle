package  
{
	/**
	 * @brief GameManager Singleton
	 * @author Jose Luis Jimenez Urbano
	 */
	public final class GameManager {
		
		private static var _instance:GameManager;
		
		public function Instance(){
			if(_instance){
				throw new Error("There is already a GameManager... Now Use GetGameManager()");
			} 
			_instance = this;
		}
		
		public static function GetGameManager():Singleton{
			if(!_instance){
				new GameManager();
			} 
			return _instance;
		}
		
	}

}