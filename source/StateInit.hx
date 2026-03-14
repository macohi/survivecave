import flixel.FlxG;

class StateInit extends State
{
	public static var cave_world_backdrop:World;
	public static var cave_world_torch_backdrop:World;

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
		switchState(new StateCave());
		return;
		#end

		#if INVENTORY
		Global.LAST_GAMEPLAY_STATE = 1;
		switchState(new StateInventory());
		return;
		#end

		#if MINING
		switchState(new StateMining());
		return;
		#end

		switchState(new StateGame());
	}

	public static function createCaveWorldBackdrop()
	{
		if (cave_world_backdrop != null) return;

		cave_world_backdrop = new World().generateRandomWorld(25.0, 'dirt_block_wall', 'stone_wall', World.WORLD_HEIGHT - 4);
		cave_world_backdrop.y = -cave_world_backdrop.members[0].y;

		var offset = 0;
		var fadeBlockAmt:Int = 4;
		var sID = cave_world_backdrop.members[cave_world_backdrop.members.length - 1].ID;

		while (offset < World.WORLD_HEIGHT - fadeBlockAmt)
		{
			final calc = sID - (offset * World.WORLD_WIDTH);

			if (offset < fadeBlockAmt)
				cave_world_backdrop.addBlock(new SpriteBlockFade(), calc);
			else
				cave_world_backdrop.addBlock(new SpriteBlock('stone'), calc);

			offset++;
		}

		cave_world_backdrop.refresh();
	}
}
