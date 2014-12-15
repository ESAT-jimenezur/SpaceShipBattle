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
	import flash.text.TextField;
	import flash.text.TextFormat;
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
		private var timer:Timer;
		private var text:TextField = new TextField();
		private var textFormat:TextFormat = new TextFormat();
		
		// settings
		const PARTICLE_MULT = 200;
		const PARTICLE_MAX_SIZE = 2;
		const PARTICLE_SPEED = 10;
		
		public function drawGame():void {
			
			drawCursor(GameManager.getCurrentScene);
			
			drawStars();
			drawShip();
			
			drawHUD();
		}
		
		private function drawHUD():void {
			text.text = "Score " + GameManager.score.toString();
		}
		
		public function init():void {
			generateStars();
			drawHUD();
			
			space_bg = new Assets.space_bg();
			space_ship = new Assets.ss_ship3();
			
			addChild(space_bg);
			addChild(space_ship);
			
			timer = new Timer(2000);
			timer.addEventListener(TimerEvent.TIMER, generateEnemyShip);
			timer.start();
			
			
			text.x = Misc.stageWidth / 4;
			text.y = 10;
			textFormat.size = 30;
			text.defaultTextFormat = textFormat;
			text.textColor = 0xFFFFFF;
			text.width = 300;
			text.text = "Score 0";
			addChild(text);
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
				if (bullets[i].y > 0) {
					
					for (var j:Number = 0; j < enemy_ships.length; j++) {     
						if (bullets[i].hitTestObject(enemy_ships[j])) {
							//Bullet collission with enemy ship
							explosion(bullets[i].x, bullets[i].y);
							removeChild(bullets[i]);
							bullets.splice(i, 1);
							
							removeChild(enemy_ships[j]);
							enemy_ships.splice(j, 1);
							
							GameManager.score += 5;
							
						}else {
							bullets[i].y -= 10;
							addChild(bullets[i]);
						}
					}
					
					
					
				}else {
					removeChild(bullets[i]);
					bullets.splice(i, 1);
				}
			}
		}
		

		
		private function generateEnemyShip(event:TimerEvent):void {
			trace("Generating enemy");
			var enemy_ship:Bitmap;
			var ranX:uint = uint(Math.random() * Misc.stageWidth);
			enemy_ship = new Assets.enemy_ship1();
			enemy_ship.y =  -100;
			enemy_ship.x = ranX;
			enemy_ship.rotation = 180;
			addEventListener(Event.ENTER_FRAME, moveShips);
			enemy_ships.push(enemy_ship);
			addChild(enemy_ship);
		}
		
		private function moveShips(e:Event):void {
			for (var i:Number = 0; i < enemy_ships.length; i++) {
				if (enemy_ships[i].y < Misc.stageHeight + enemy_ships[i].height) {
					enemy_ships[i].y += 7;
					addChild(enemy_ships[i]);
				}else {
					removeChild(enemy_ships[i]);
					enemy_ships.splice(i, 1);
				}
				
			}
		}
		
		
		
		
		
		// explosion function
function explosion(x1:Number, y1:Number):void{
	var particle_qty:Number = Math.random() * (PARTICLE_MULT/2) + (PARTICLE_MULT/2);
	for(var i:int=0; i<particle_qty; i++){
		var pSize:Number = Math.random() * (PARTICLE_MAX_SIZE-1) + 1;
		var pAlpha:Number = Math.random();
 
		// draw the particle
		var p:Sprite = new Sprite();
		p.graphics.beginFill(0xFF0000);
		p.graphics.drawCircle(0,0,pSize);
 
		// create a movieclip so we can add properties to it
		var particle:MovieClip = new MovieClip();
		particle.addChild(p);
		particle.x = x1;
		particle.y = y1;
		particle.alpha = pAlpha;
 
		// choose a direction and speed to send the particle
		var pFast:int = Math.round(Math.random() * 0.75);
		particle.pathX = (Math.random() * PARTICLE_SPEED - PARTICLE_SPEED/2) + 
			pFast * (Math.random() * 10 - 5);
		particle.pathY = (Math.random() * PARTICLE_SPEED - PARTICLE_SPEED/2) + 
			pFast * (Math.random() * 10 - 5);
 
		// this event gets triggered every frame
		particle.addEventListener(Event.ENTER_FRAME, particlePath);
		addChild(particle);
	}
}
 
// moves the particle
function particlePath(e:Event):void{
	e.target.x += e.target.pathX;
	e.target.y += e.target.pathY;
	e.target.alpha -= 0.005;
 
	// removes the particle from stage when its alpha reaches zero
	if(e.target.alpha <= 0){
		e.target.removeEventListener('enterFrame', particlePath);
		e.target.parent.removeChild(e.target);
	}
}
		
		
		
		
	}
}