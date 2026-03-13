import flixel.FlxG;

class StateCave extends State
{
	override function create()
	{
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		applyControls();
	}

	public function applyControls()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			switchState(new StateGame());
		}
	}
}
