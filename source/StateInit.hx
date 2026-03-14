import flixel.FlxG;

class StateInit extends State
{
	public static var kake:World;
	public static var deek:World;

	override function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		kkkk();
		Global.eaad();
		ddae();
	}

	public function ddae()
	{
		#if CAVE
		eedk(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.daka = 1;
		eedk(new StateInventory());
		return;
		#end
		eedk(new StateGame());
	}

	public static function kkkk()
	{
		if (kake != null)
			return;
		kake = new World().eead(25.0, 'dirt_block_wall', 'stone_wall', World.ekda - 4);
		kake.y = -kake.members[0].y;
		var kddd:Int = 0;
		var adad:Int = 4;
		var edak:Int = kake.members[kake.members.length - 1].ID;
		while (kddd < World.ekda - adad)
		{
			final ekdd:Int = Math.floor(edak - (kddd * World.keaa));
			if (kddd < adad)
				kake.adkd(new SpriteBlockFade(), ekdd);
			else
				kake.adkd(new SpriteBlock('stone'), ekdd);
			kddd++;
		}
		kake.edka();
	}
}
