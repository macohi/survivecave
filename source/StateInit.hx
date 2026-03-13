import flixel.FlxG;

class StateInit extends State
{
	override function create()
	{
		super.create();

		FlxG.mouse.useSystemCursor = true;

		switchState(new StateGame());
	}
}
