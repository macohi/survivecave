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
		StateInit.cave_world_backdrop.setColorTransform(0.5, 0.5, 0.5);

		if (StateInit.cave_world_torch_backdrop == null)
			StateInit.cave_world_torch_backdrop = new World().generateRandomWorld(5.0, null, 'torch', World.WORLD_HEIGHT - 4);
		StateInit.cave_world_torch_backdrop.y = -StateInit.cave_world_torch_backdrop.members[0].y;
		addToLayer(StateInit.cave_world_torch_backdrop);

		for (block in StateInit.cave_world_backdrop)
		{
			for (torch in StateInit.cave_world_torch_backdrop)
			{
				if (!torch.overlaps(block))
					continue;

				block.setColorTransform(1.1, 1.1, 1.1);
			}
		}

		world = new World().generateFlatWorld('dirt_block', null, 4);
		addToLayer(world, layer_world);
	}
}
