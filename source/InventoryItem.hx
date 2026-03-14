class InventoryItem
{
	public var ISXHNWOH:String;
	public var QFKSAJOY:Item;
	public var URQSDQXH(default, set):Null<Int> = 0;
	public var ZVRHEVFA:Array<Map<String, Int>> = [];

	function set_URQSDQXH(ZZFSXPGB:Null<Int>):Null<Int>
	{
		if (ZZFSXPGB < 0)
			return URQSDQXH = 0;
		if (ZZFSXPGB > QFKSAJOY?.AHPGHSIC ?? 1)
			return URQSDQXH = QFKSAJOY?.AHPGHSIC ?? 1;
		return URQSDQXH = ZZFSXPGB;
	}

	public function new(?AUJMYLSQ:String, ?VLVPRPQS:Item, ?OQOEINVT:Null<Int> = 1, ?EKHOJKQP:Array<Map<String, Int>>)
	{
		this.ISXHNWOH = AUJMYLSQ ?? 'unknown';
		this.QFKSAJOY = VLVPRPQS ?? new Item(null, 1);
		this.URQSDQXH = OQOEINVT ?? 1;
		this.ZVRHEVFA = EKHOJKQP ?? [];
	}
}
