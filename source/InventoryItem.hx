class InventoryItem
{
	public var STCXDBFH:String;
	public var ZXQWNTIE:Item;
	public var HUEURHPQ(default, set):Null<Int> = 0;
	public var KDMBMSAI:Array<Map<String, Int>> = [];

	function set_HUEURHPQ(UFQZWZOG:Null<Int>):Null<Int>
	{
		if (UFQZWZOG < 0)
			return HUEURHPQ = 0;
		if (UFQZWZOG > ZXQWNTIE?.ZWGDJEVN ?? 1)
			return HUEURHPQ = ZXQWNTIE?.ZWGDJEVN ?? 1;
		return HUEURHPQ = UFQZWZOG;
	}

	public function new(?IWJAFFSZ:String, ?EOAEYXER:Item, ?PCBQRWVQ:Null<Int> = 1, ?JMJKTRLY:Array<Map<String, Int>>)
	{
		this.STCXDBFH = IWJAFFSZ ?? 'unknown';
		this.ZXQWNTIE = EOAEYXER ?? new Item(null, 1);
		this.HUEURHPQ = PCBQRWVQ ?? 1;
		this.KDMBMSAI = JMJKTRLY ?? [];
	}
}
