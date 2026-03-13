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

		if (StateInit.cave_world_backdrop == null)
			StateInit.cave_world_backdrop = new World().generateRandomWorld(25.0, 'dirt_block_wall', 'stone_wall', World.WORLD_HEIGHT - 4);
		StateInit.cave_world_backdrop.y = -StateInit.cave_world_backdrop.members[0].y;
		addToLayer(StateInit.cave_world_backdrop, 1);

		world = new World().generateFlatWorld('dirt_block', null, 4);
		addToLayer(world, layer_world);
	}
}
