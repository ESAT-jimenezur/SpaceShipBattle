package {
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.engine.SpaceJustifier;
	import flash.ui.Mouse;
	import flash.utils.Timer;

	
	/**
	 *
	 * @author Jose Luis Jimenez Urbano
	 */
	
	public final class Draw extends MovieClip {
		
		private var thumb_mc:MovieClip = new MovieClip();
		private var space_bg:Bitmap;
		private var space_ship:Bitmap;
		private var bullet:Shape;
		private var bullets:Array = []; 
		private var small_stars:Array = [];
		private var medium_stars:Array = [];
		private var enemy_ships:Array = [];

		public function drawGame():void {
			
			drawCursor(GameManager.getCurrentScene);
			
			space_bg = new Assets.space_bg();
			space_ship = new Assets.ss_ship3();
			
			addChild(space_bg);
			addChild(space_ship);
			
			
			drawStars();
			drawShip();
			
			
			
			//generateEnemyShips();
		}
		
		public function init():void {
			generateStars();
		}

		
		private function drawCursor(cursor_type:String):void{
			if (cursor_type == "game"){
				//Mouse.hide();	
				//Draw a different cursor here
			}
		}
		
		private function drawShip():void {
			space_ship.x = GameManager.ship_pos_x;
			space_ship.y = GameManager.ship_pos_y;
			
			//Disable rotation
			//var dir:Number = Math.atan2(space_ship.y - GameManager.mouse_pos_y, space_ship.x  - GameManager.mouse_pos_x);
			//space_ship.rotation = dir * 180 / Math.PI + 180 + 65;
		}
		
		private function generateStars():void {
			//Small stars
			for (var i:Number = 0; i < 100; i++) {
				var ranX:uint = uint(Math.random() * Misc.stageWidth * 2);
				var ranY:uint = uint(Math.random() * Misc.stageHeight * 2);
				
				var star:Shape = new Shape();
				star.x = ranX;
				star.y = ranY;
				star.graphics.clear();
				star.graphics.beginFill(0xFFFFFF);
				star.graphics.drawCircle(0, 0, 1);
				small_stars.push(star);
			}
			
			//Medium stars
			for (var a:Number = 0; a < 25; a++) {
				var ranX2:uint = uint(Math.random() * Misc.stageWidth);
				var ranY2:uint = uint(Math.random() * Misc.stageHeight);
				
				var star2:Shape = new Shape();
				star2.x = ranX2;
				star2.y = ranY2;
				star2.graphics.clear();
				star2.graphics.beginFill(0xFFFFFF);
				star2.graphics.drawCircle(0, 0, 3);
				medium_stars.push(star2);
			}
		}
		
		private function drawStars():void {
			
			for (var i:Number = 0; i < small_stars.length; i++) {
				addChild(small_stars[i]);				
			}
			
			for (var a:Number = 0; a < medium_stars.length; a++) {
				addChild(medium_stars[a]);
				
			}
		}
		
		public function createBullet():void {
			var b:Shape = new Shape();
			b.x = GameManager.ship_pos_x + space_ship.width / 2;
			b.y = GameManager.ship_pos_y;
			b.graphics.clear();
			b.graphics.beginFill(0x00FF00);
			b.graphics.drawCircle(0, 0, 5);
			addEventListener(Event.ENTER_FRAME, moveBullet);
			bullets.push(b);
		}
		
		private function moveBullet(e:Event):void {
			for (var i:Number = 0; i < bullets.length; i++) {
				bullets[i].y -= 10;
				addChild(bullets[i]);				
			}
		}
		
		
		private function updateBullets():void {
			/*
			bullet = new Shape();
			bullet.graphics.clear();
			bullet.graphics.lineStyle(2, 0x000000);
			bullet.graphics.beginFill(0x00FF00);
			bullet.graphics.drawCircle(0, 0, 3);
			bullet.graphics.endFill();
			bullet.x = GameManager.ship_pos_x + space_ship.width / 2;
			bullet.y = GameManager.ship_pos_y;
			addChild(bullet);
			*/
			
		}

		
		private function generateEnemyShips(event:TimerEvent):void {
			var enemy_ship:Bitmap;
			var ranX:uint = uint(Math.random() * Misc.stageWidth * 2);
			enemy_ship = new Assets.enemy_ship1();
			enemy_ship.y =  -100;
			enemy_ship.x = ranX;
			addEventListener(Event.ENTER_FRAME, moveShips);
			enemy_ships.push(enemy_ship);
			//addChild(enemy_ship);
			timer = null;
		}
		
		private function moveShips(e:Event):void {
			for (var i:Number = 0; i < enemy_ships.length; i++) {
				enemy_ships[i].y += 10;
				addChild(enemy_ships[i]);
			}
		}
		
	}
}