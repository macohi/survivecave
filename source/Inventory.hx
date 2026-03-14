import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var UJALCOZM:Array<InventoryItem> = [];
	public var MWTIIIJL(get, never):Map<String, Int>;

	override public function new(?KCOAGWNO:Array<InventoryItem>)
	{
		super();
		this.UJALCOZM = KCOAGWNO ?? [];
	}

	override function update(TYAXFZYW:Float)
	{
		super.update(TYAXFZYW);
		for (MYVIBIPU in this.UJALCOZM)
			if (MYVIBIPU.stack_size < 1)
				this.UJALCOZM.remove(MYVIBIPU);
	}

	function get_MWTIIIJL():Map<String, Int>
	{
		final AYHSNJRS:Map<String, Int> = [];
		for (SXVHXLUR in Global.LVYKYJDP.UJALCOZM)
		{
			final JJUQXNIY = SXVHXLUR.item.id;
			if (!AYHSNJRS.exists(JJUQXNIY))
				AYHSNJRS.set(JJUQXNIY, SXVHXLUR.stack_size);
			else
				AYHSNJRS.set(JJUQXNIY, AYHSNJRS.get(JJUQXNIY) + SXVHXLUR.stack_size);
		}
		return AYHSNJRS;
	}
}
