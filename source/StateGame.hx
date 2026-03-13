import lime.app.Application;
import flixel.text.FlxText;

class StateGame extends State
{
	public var world:World;

	public var player:SpriteAnimatedPlayer;

	public var versionText:FlxText = new FlxText(0, 0, 0, 'Survivecave Indev ${Application.current.meta.get('version')}', 8);

	override public function create()
	{
		super.create();

		addToLayer(versionText, 1000);

		world = new World().generateFlatWorld();
		addToLayer(world, 1);

		player = new SpriteAnimatedPlayer(0, 0);
		player.screenCenter();
		addToLayer(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
