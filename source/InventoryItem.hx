class InventoryItem
{
	public var FWIXZKYM:String;
	public var OBKQAFED:Item;
	public var MMVJTIOW(default, set):Null<Int> = 0;
	public var GRMVOABD:Array<Map<String, Int>> = [];

	function set_MMVJTIOW(DEEFVIGB:Null<Int>):Null<Int>
	{
		if (DEEFVIGB < 0)
			return MMVJTIOW = 0;
		if (DEEFVIGB > OBKQAFED?.QWTKCHYE ?? 1)
			return MMVJTIOW = OBKQAFED?.QWTKCHYE ?? 1;
		return MMVJTIOW = DEEFVIGB;
	}

	public function new(?PDWPDJWS:String, ?JLIFHVNO:Item, ?AYCGWMBM:Null<Int> = 1, ?VFCEXRAJ:Array<Map<String, Int>>)
	{
		this.FWIXZKYM = FWIXZKYM ?? 'unknown';
		this.OBKQAFED = OBKQAFED ?? new Item(null, 1);
		this.MMVJTIOW = MMVJTIOW ?? 1;
		this.GRMVOABD = GRMVOABD ?? [];
	}
}
