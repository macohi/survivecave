import flixel.text.FlxText;

class PlayState extends State
{
	public var versionText:FlxText = new FlxText(10, 10, 0, 'Survivecave Indev', 16);

	override public function create()
	{
		super.create();

		addToLayer(versionText, 1000);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
