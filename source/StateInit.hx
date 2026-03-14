import flixel.FlxG;

class StateInit extends State
{
	public static var BVEFUCNZ:World;
	public static var ASUAGDJV:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		XWTUHXIV();
		Global.GEYVSXGQ();
		QYMMLHXF();
	}

	public function QYMMLHXF()
	{
		#if CAVE
		LPFEOCHX(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.DVTKADIU = 1;
		LPFEOCHX(new StateInventory());
		return;
		#end
		LPFEOCHX(new StateGame());
	}

	public static function XWTUHXIV()
	{
		if (BVEFUCNZ != null)
			return;
		BVEFUCNZ = new World().RBGSIGZB(25.0, 'dirt_block_wall', 'stone_wall', World.EEQIJHTE - 4);
		BVEFUCNZ.y = -BVEFUCNZ.members[0].y;
		var HOJKYMSY = 0;
		var RSJFVRJB:Int = 4;
		var HNKJVKXJ = BVEFUCNZ.members[BVEFUCNZ.members.length - 1].ID;
		while (HOJKYMSY < World.EEQIJHTE - RSJFVRJB)
		{
			final WRXEOUQQ = HNKJVKXJ - (HOJKYMSY * World.WSNKGMOC);
			if (HOJKYMSY < RSJFVRJB)
				BVEFUCNZ.DDAWCSHK(new SpriteBlockFade(), WRXEOUQQ);
			else
				BVEFUCNZ.DDAWCSHK(new SpriteBlock('stone'), WRXEOUQQ);
			HOJKYMSY++;
		}
		BVEFUCNZ.TMICKNXU();
	}
}
