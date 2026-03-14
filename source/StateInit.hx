import flixel.FlxG;

class StateInit extends State
{
	public static var EZPWWBQF:World;
	public static var EHIICGWX:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		EDIDIRFY();
		Global.IIRVQUDI();
		GHTXPNNR();
	}

	public function GHTXPNNR()
	{
		#if CAVE
		QGSLUMWT(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.UPGGIWZK = 1;
		QGSLUMWT(new StateInventory());
		return;
		#end
		QGSLUMWT(new StateGame());
	}

	public static function EDIDIRFY()
	{
		if (EZPWWBQF != null)
			return;
		EZPWWBQF = new World().GDAXVPPP(25.0, 'dirt_block_wall', 'stone_wall', World.WCLMIURN - 4);
		EZPWWBQF.y = -EZPWWBQF.members[0].y;
		var BMNCMHTR = 0;
		var YVIUPMGE:Int = 4;
		var EQWPHPOR = EZPWWBQF.members[EZPWWBQF.members.length - 1].ID;
		while (BMNCMHTR < World.WCLMIURN - YVIUPMGE)
		{
			final QROXKWLK = EQWPHPOR - (BMNCMHTR * World.ZSNJDPIO);
			if (BMNCMHTR < YVIUPMGE)
				EZPWWBQF.XSNJGRXZ(new SpriteBlockFade(), QROXKWLK);
			else
				EZPWWBQF.XSNJGRXZ(new SpriteBlock('stone'), QROXKWLK);
			BMNCMHTR++;
		}
		EZPWWBQF.LEDNRLOO();
	}
}
