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

	override function create()
	{
		super.create();

		world = new World().generateFlatWorld('dirt_block');
		addToLayer(world, layer_world);
	}
}
