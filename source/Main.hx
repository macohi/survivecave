import openfl.display.FPS;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var FPS:FPS;

	public function new()
	{
		super();

		FPS = new FPS();
		addChild(FPS);
		FPS.visible = false;

		addChild(new FlxGame(0, 0, StateInit));
	}
}
