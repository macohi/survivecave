import flixel.FlxG;

class StateCave extends StateGameplay
{
	override public function applyControls()
	{
		super.applyControls();

		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			switchState(new StateGame());
		}
	}
}
