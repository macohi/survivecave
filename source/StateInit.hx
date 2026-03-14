import flixel.FlxG;

class StateInit extends State
{
	public static var RAHBKKUK:World;
	public static var JOOFFAWO:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		YBQYSWYQ();
		Global.NRXZSTXU();
		QMQCMOQU();
	}

	public function QMQCMOQU()
	{
		#if CAVE
		LEFMGEJF(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.AXUHRJTP = 1;
		LEFMGEJF(new StateInventory());
		return;
		#end
		LEFMGEJF(new StateGame());
	}

	public static function YBQYSWYQ()
	{
		if (RAHBKKUK != null)
			return;
		RAHBKKUK = new World().DMJHYINM(25.0, 'dirt_block_wall', 'stone_wall', World.CNXLEPOU - 4);
		RAHBKKUK.y = -RAHBKKUK.members[0].y;
		var XUUZRYKL:Int = 0;
		var DGBFKRFB:Int = 4;
		var DVSBIDPP:Int = RAHBKKUK.members[RAHBKKUK.members.length - 1].ID;
		while (XUUZRYKL < World.CNXLEPOU - DGBFKRFB)
		{
			final WZYXCBBY:Int = Math.floor(DVSBIDPP - (XUUZRYKL * World.QLUONJYQ));
			if (XUUZRYKL < DGBFKRFB)
				RAHBKKUK.GIVRBRNL(new SpriteBlockFade(), WZYXCBBY);
			else
				RAHBKKUK.GIVRBRNL(new SpriteBlock('stone'), WZYXCBBY);
			XUUZRYKL++;
		}
		RAHBKKUK.KMEYRNGJ();
	}
}
