package states;

import flixel.system.debug.log.LogStyle;
import flixel.FlxG;

class StateInit extends State
{
	public static var caveWorldBG:GroupWorld;

	override function create()
	{
		super.create();

		#if !debug
		FlxG.debugger.toggleKeys = [];

		LogStyle.ERROR.openConsole = false;
		LogStyle.ERROR.errorSound = null;
		LogStyle.WARNING.openConsole = false;
		LogStyle.WARNING.errorSound = null;
		#end

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

		#if SHOP
		Global.LAST_GAMEPLAY_STATE.value = 2;
		switchState(new GUIShop());
		return;
		#end

		if (Global.LAST_GAMEPLAY_STATE.value == 2)
			switchState(new StateCave());
		if (Global.LAST_GAMEPLAY_STATE.value == 1)
			switchState(new StateGround());
		else
			switchState(new GUIMainMenu());
	}

	public static function createCaveWorldBackdrop()
	{
		if (caveWorldBG != null)
			return;

		caveWorldBG = new GroupWorld().generateRandomWorld(25.0, 'dirt_block_wall', 'stone_wall', GroupWorld.WORLD_HEIGHT - 4);
		caveWorldBG.y = -caveWorldBG.members[0].y;

		var offset = 0;
		var fadeBlockAmt:Int = 4;
		var sID = caveWorldBG.members[caveWorldBG.members.length - 1].ID;

		while (offset < GroupWorld.WORLD_HEIGHT - fadeBlockAmt)
		{
			final calc = sID - (offset * GroupWorld.WORLD_WIDTH);

			if (offset < fadeBlockAmt)
				caveWorldBG.addBlock(SpriteBlockList.FADE, calc);
			else
				caveWorldBG.addBlock(SpriteBlockList.STONE, calc);

			offset++;
		}

		caveWorldBG.refresh();
	}
}
