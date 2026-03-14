class InventoryItem
{
	public var PQIHAHOU:String;
	public var IPMKUKCP:Item;
	public var RZVIMZXL(default, set):Null<Int> = 0;
	public var ZIMDYPEV:Array<Map<String, Int>> = [];

	function set_RZVIMZXL(SHSKVQSC:Null<Int>):Null<Int>
	{
		if (SHSKVQSC < 0)
			return RZVIMZXL = 0;
		if (SHSKVQSC > IPMKUKCP?.OOLPMYBI ?? 1)
			return RZVIMZXL = IPMKUKCP?.OOLPMYBI ?? 1;
		return RZVIMZXL = SHSKVQSC;
	}

	public function new(?GSMINZWG:String, ?ZTEKGFGK:Item, ?RAPYSYFK:Null<Int> = 1, ?IIBGJJSC:Array<Map<String, Int>>)
	{
		this.PQIHAHOU = GSMINZWG ?? 'unknown';
		this.IPMKUKCP = ZTEKGFGK ?? new Item(null, 1);
		this.RZVIMZXL = RAPYSYFK ?? 1;
		this.ZIMDYPEV = IIBGJJSC ?? [];
	}
}
