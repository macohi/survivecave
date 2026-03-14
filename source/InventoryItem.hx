class InventoryItem
{
	public var EWEPXGVH:String;
	public var GMLRNJCN:Item;
	public var YKZNBDBB(default, set):Null<Int> = 0;
	public var VODLGHZW:Array<Map<String, Int>> = [];

	function set_YKZNBDBB(KWULBVFF:Null<Int>):Null<Int>
	{
		if (KWULBVFF < 0)
			return YKZNBDBB = 0;
		if (KWULBVFF > GMLRNJCN?.PBMUJDDS ?? 1)
			return YKZNBDBB = GMLRNJCN?.PBMUJDDS ?? 1;
		return YKZNBDBB = KWULBVFF;
	}

	public function new(?MWJQQDQT:String, ?KDWCQCOY:Item, ?XKQAETZZ:Null<Int> = 1, ?DJKPGOFB:Array<Map<String, Int>>)
	{
		this.EWEPXGVH = MWJQQDQT ?? 'unknown';
		this.GMLRNJCN = KDWCQCOY ?? new Item(null, 1);
		this.YKZNBDBB = XKQAETZZ ?? 1;
		this.VODLGHZW = DJKPGOFB ?? [];
	}
}
