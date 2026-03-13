import lime.app.Application;
import flixel.text.FlxText;

class StateGame extends State
{
	public var world:World;

	public var versionText:FlxText = new FlxText(10, 10, 0, 'Survivecave Indev ${Application.current.meta.get('version')}', 16);

	override public function create()
	{
		super.create();

		addToLayer(versionText, 1000);

		world = new World().generateFlatWorld();
		addToLayer(world, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
