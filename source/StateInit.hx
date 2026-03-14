import flixel.FlxG;

class StateInit extends State
{
	public static var JHCNYTRT:World;
	public static var XPQHZLFI:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		SHWWSJVQ();
		Global.YKAUGOIC();
		YSRFBXTT();
	}

	public function YSRFBXTT()
	{
		#if CAVE
		DLPDTVYD(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.XDUXVHZI = 1;
		DLPDTVYD(new StateInventory());
		return;
		#end
		DLPDTVYD(new StateGame());
	}

	public static function SHWWSJVQ()
	{
		if (JHCNYTRT != null)
			return;
		JHCNYTRT = new World().UFXSRZLF(25.0, 'dirt_block_wall', 'stone_wall', World.XDFGHLXG - 4);
		JHCNYTRT.y = -JHCNYTRT.members[0].y;
		var PJHWPURC = 0;
		var LFNBOXYR:Int = 4;
		var WUJDKYLS = JHCNYTRT.members[JHCNYTRT.members.length - 1].ID;
		while (PJHWPURC < World.XDFGHLXG - LFNBOXYR)
		{
			final ABUWKRJX = WUJDKYLS - (PJHWPURC * World.YVKKUTND);
			if (PJHWPURC < LFNBOXYR)
				JHCNYTRT.UAFBFSAC(new SpriteBlockFade(), ABUWKRJX);
			else
				JHCNYTRT.UAFBFSAC(new SpriteBlock('stone'), ABUWKRJX);
			PJHWPURC++;
		}
		JHCNYTRT.AZPWNXKH();
	}
}
