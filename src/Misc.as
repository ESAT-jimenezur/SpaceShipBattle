package{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 */
	public class Misc {
		
		public static var _main:*;
		public static var _stage:Stage;
		public static var stageWidth:uint;
		public static var stageHeight:uint;
		public static var characterSelected:uint;
		
		public static function set setMain(main:*):void {
			_main = main;
			_stage = _main.stage;
			stageWidth = _stage.stageWidth;
			stageHeight = _stage.stageHeight;	
		}
		
		public static function get getMain():* {
			return _main;
		}
		
		/**
		 * @param	color
		 */
		public static function changeStageColor( color : uint ) : void {
			var bg:Sprite;
			bg ||= new Sprite();
			bg.graphics.clear();
			bg.graphics.beginFill( color, 1 );
			bg.graphics.drawRect( 0,0, _stage.stageWidth, _stage.stageHeight );
			bg.graphics.endFill();
			_stage.addChildAt( bg, 0 );
		}
		
		
	}

}