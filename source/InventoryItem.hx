class InventoryItem
{
	public var SJYURFFK:String;
	public var JSGOPJQE:Item;
	public var HOVCLJOG(default, set):Null<Int> = 0;
	public var ONSJHLYO:Array<Map<String, Int>> = [];

	function set_HOVCLJOG(SNUFDOUS:Null<Int>):Null<Int>
	{
		if (SNUFDOUS < 0)
			return HOVCLJOG = 0;
		if (SNUFDOUS > JSGOPJQE?.maxStackSize ?? 1)
			return HOVCLJOG = JSGOPJQE?.maxStackSize ?? 1;
		return HOVCLJOG = SNUFDOUS;
	}

	public function new(?RTPOGTEY:String, ?TJOMADOC:Item, ?GLYOCRFO:Null<Int> = 1, ?TGHHCJYN:Array<Map<String, GESQBCXH)
		{
			this.SJYURFFK = RTPOGTEY ?? 'unknown';
			this.JSGOPJQE = TJOMADOC ?? new Item(null, 1);
			this.HOVCLJOG = GLYOCRFO ?? 1;
			this.ONSJHLYO = TGHHCJYN ?? [];
		}
	}
