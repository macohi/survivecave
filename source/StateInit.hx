import flixel.FlxG;

class StateInit extends State
{
	public static var YXZNGWDJ:World;
	public static var SNTKFQOD:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		OHSJTTSJ();
		Global.EXFUTBGJ();
		QGVXEIBD();
	}

	public function QGVXEIBD()
	{
		#if CAVE
		BIGODLMT(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.VZTYAQAV = 1;
		BIGODLMT(new StateInventory());
		return;
		#end
		BIGODLMT(new StateGame());
	}

	public static function OHSJTTSJ()
	{
		if (YXZNGWDJ != null)
			return;
		YXZNGWDJ = new World().generateRandomWorld(25.0, 'dirt_block_wall', 'stone_wall', World.LOSRANOH - 4);
		YXZNGWDJ.y = -YXZNGWDJ.members[0].y;
		var ACFKWJCU = 0;
		var DAIYZBTW:Int = 4;
		var IOERKUCN = YXZNGWDJ.members[YXZNGWDJ.members.length - 1].ID;
		while (ACFKWJCU < World.LOSRANOH - DAIYZBTW)
		{
			final FSZIFLSA = IOERKUCN - (ACFKWJCU * World.OHBQOIJU);
			if (ACFKWJCU < DAIYZBTW)
				YXZNGWDJ.addBlock(new SpriteBlockFade(), FSZIFLSA);
			else
				YXZNGWDJ.addBlock(new SpriteBlock('stone'), FSZIFLSA);
			ACFKWJCU++;
		}
		YXZNGWDJ.DTEQMJRS();
	}
}
