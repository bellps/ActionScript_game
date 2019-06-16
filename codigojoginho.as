package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	

	public class codigojoginho extends MovieClip {
		var clicoupcima: Boolean = false;
		var fowardSpeed: int = 3;
		
		//musiquinha
		var mySound:bg_music = new bg_music;
		var myChannel:SoundChannel= mySound.play();
		var birdSound:up_sound = new up_sound;
		
		
		public function codigojoginho() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downKeyCallback);
			stage.addEventListener(KeyboardEvent.KEY_UP, upKeyCallback);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		//loop pra sempre verificar se tem tecla sendo mencionada/se bateu em algo
		public function loop(e: Event): void {
			if (birdplay.hitTestObject(obstaculo1) || birdplay.hitTestObject(obstaculo2) || birdplay.hitTestObject(obstaculo3) || birdplay.hitTestObject(obstaculo4) || birdplay.hitTestObject(obstaculo5) || birdplay.hitTestObject(p1) || birdplay.hitTestObject(p3) || birdplay.hitTestObject(p4) || birdplay.hitTestObject(p5) || birdplay.hitTestObject(p6) || birdplay.hitTestObject(bA) || birdplay.hitTestObject(bB) || birdplay.hitTestObject(bC) || birdplay.hitTestObject(bD)) {
				gotoAndStop("died");
			}
			if (birdplay.hitTestObject(birdfinal)){
				gotoAndStop("win");
			}
			if (clicoupcima) {
				birdplay.y = birdplay.y - 26;
				var myGame:SoundChannel = birdSound.play();
			}
			
			birdplay.y = birdplay.y + 6;
			predios();
			nuvens();
			victory()
		}
		
		//pulinhos
		public function downKeyCallback(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.UP) {
				clicoupcima = true;
			}
		}
		public function upKeyCallback(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.UP) {
				clicoupcima = false;
			}
		}
		
		//movimentacao dos obstaculos e namoradinha
		public function predios() {
			p1.x -= fowardSpeed;
			p3.x -= fowardSpeed;
			p4.x -= fowardSpeed;
			p5.x -= fowardSpeed;
			p6.x -= fowardSpeed;
		}
		public function nuvens(){
			obstaculo1.x -= fowardSpeed;			
			obstaculo2.x -= fowardSpeed;
			obstaculo3.x -= fowardSpeed;
			obstaculo4.x -= fowardSpeed;
			obstaculo5.x -= fowardSpeed;
		}
		public function victory(){
			love.x -= fowardSpeed;			
			birdfinal.x -= fowardSpeed;
		}
	}
}