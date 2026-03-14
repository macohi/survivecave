package states;

import flixel.FlxG;

class StateInit extends State
{
	public static var cave_world_backdrop:GroupWorld;
	public static var cave_world_torch_backdrop:GroupWorld;

	override function create()
	{
		super.create();

		FlxG.mouse.useSystemCursor = true;

		createCaveWorldBackdrop();

		Global.init();

		moveToMainState();
	}

	public function moveToMainState()
	{
		#if CAVE
		Global.LAST_GAMEPLAY_STATE.value = 2;
		#end

		#if INVENTORY
		#if !CAVE
		Global.LAST_GAMEPLAY_STATE.value = 1;
		#end

		switchState(new GUIInventory());
		return;
		#end

		#if MINING
		Global.LAST_GAMEPLAY_STATE.value = 2;
		switchState(new GUIMining());
		return;
		#end

		if (Global.LAST_GAMEPLAY_STATE.value == 2)
			switchState(new StateCave());
		if (Global.LAST_GAMEPLAY_STATE.value == 1)
			switchState(new StateGame());
		else
			switchState(new GUIMainMenu());
	}

	public static function createCaveWorldBackdrop()
	{
		if (cave_world_backdrop != null)
			return;

		cave_world_backdrop = new GroupWorld().generateRandomWorld(25.0, 'dirt_block_wall', 'stone_wall', GroupWorld.WORLD_HEIGHT - 4);
		cave_world_backdrop.y = -cave_world_backdrop.members[0].y;

		var offset = 0;
		var fadeBlockAmt:Int = 4;
		var sID = cave_world_backdrop.members[cave_world_backdrop.members.length - 1].ID;

		while (offset < GroupWorld.WORLD_HEIGHT - fadeBlockAmt)
		{
			final calc = sID - (offset * GroupWorld.WORLD_WIDTH);

			if (offset < fadeBlockAmt)
				cave_world_backdrop.addBlock(SpriteBlockList.FADE, calc);
			else
				cave_world_backdrop.addBlock(SpriteBlockList.STONE, calc);

			offset++;
		}

		cave_world_backdrop.refresh();
	}
}
