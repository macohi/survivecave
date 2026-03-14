import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var NSOGSLFA:Array<InventoryItem> = [];
	public var RGFUUDRU(get, never):Map<String, Int>;

	override public function new(?DFRPEQDX:Array<InventoryItem>)
	{
		super();
		this.NSOGSLFA = DFRPEQDX ?? [];
	}

	override function update(WWXOCRKT:Float)
	{
		super.update(WWXOCRKT);
		for (FIJTXMDR in this.NSOGSLFA)
			if (FIJTXMDR.URQSDQXH < 1)
				this.NSOGSLFA.remove(FIJTXMDR);
	}

	function get_RGFUUDRU():Map<String, Int>
	{
		final ZCNCQMHL:Map<String, Int> = [];
		for (QCCGKBPW in Global.KGDMAAGE.NSOGSLFA)
		{
			final WQSFISND:String = QCCGKBPW.QFKSAJOY.RRAJBBNZ;
			if (!ZCNCQMHL.exists(WQSFISND))
				ZCNCQMHL.set(WQSFISND, QCCGKBPW.URQSDQXH);
			else
				ZCNCQMHL.set(WQSFISND, ZCNCQMHL.get(WQSFISND) + QCCGKBPW.URQSDQXH);
		}
		return ZCNCQMHL;
	}
}
