import flixel.FlxG;

class StateInit extends State
{
	public static var GTPAJLFZ:World;
	public static var TRNFZUGE:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		WBCRQNSS();
		Global.FPYMGIWY();
		HAATRMEF();
	}

	public function HAATRMEF()
	{
		#if CAVE
		SUEEHYDO(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.HWUKCMXE = 1;
		SUEEHYDO(new StateInventory());
		return;
		#end
		SUEEHYDO(new StateGame());
	}

	public static function WBCRQNSS()
	{
		if (GTPAJLFZ != null)
			return;
		GTPAJLFZ = new World().NDJOSSLW(25.0, 'dirt_block_wall', 'stone_wall', World.PYDTXSDD - 4);
		GTPAJLFZ.y = -GTPAJLFZ.members[0].y;
		var TLGUJRUP = 0;
		var KTMFMKRE:Int = 4;
		var LQDVPVJD = GTPAJLFZ.members[GTPAJLFZ.members.length - 1].ID;
		while (TLGUJRUP < World.PYDTXSDD - KTMFMKRE)
		{
			final EZEXXBIQ = LQDVPVJD - (TLGUJRUP * World.UNXNIRGX);
			if (TLGUJRUP < KTMFMKRE)
				GTPAJLFZ.addBlock(new SpriteBlockFade(), EZEXXBIQ);
			else
				GTPAJLFZ.addBlock(new SpriteBlock('stone'), EZEXXBIQ);
			TLGUJRUP++;
		}
		GTPAJLFZ.UELMYSQN();
	}
}
