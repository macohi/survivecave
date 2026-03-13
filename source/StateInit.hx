import flixel.FlxG;

class StateInit extends State
{
	public static var cave_world_backdrop:World;
	public static var cave_world_torch_backdrop:World;

	override function create()
	{
		super.create();

		FlxG.mouse.useSystemCursor = true;

		switchState(new StateGame());
	}
}
