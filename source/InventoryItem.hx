class InventoryItem
{
	public var dekd:String;
	public var dade:Item;
	public var akkk(default, set):Null<Int> = 0;
	public var deak:Array<Map<String, Int>> = [];

	function set_akkk(aeke:Null<Int>):Null<Int>
	{
		if (aeke < 0)
			return akkk = 0;
		if (aeke > dade?.kkae ?? 1)
			return akkk = dade?.kkae ?? 1;
		return akkk = aeke;
	}

	public function new(?aaak:String, ?adka:Item, ?kaek:Null<Int> = 1, ?akee:Array<Map<String, Int>>)
	{
		this.dekd = aaak ?? 'unknown';
		this.dade = adka ?? new Item(null, 1);
		this.akkk = kaek ?? 1;
		this.deak = akee ?? [];
	}
}
