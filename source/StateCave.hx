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

	public var world_backdrop:World;

	override function create()
	{
		super.create();

		world_backdrop = new World().generateFlatWorld('dirt_block_wall', null, World.WORLD_HEIGHT);
		addToLayer(world_backdrop, 1);

		world = new World().generateFlatWorld('dirt_block', null, 4);
		addToLayer(world, layer_world);
	}
}
