import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var YRKOSOYV:Array<InventoryItem> = [];
	public var GQGMCKNC(get, never):Map<String, Int>;

	override public function new(?GURQUVEZ:Array<InventoryItem>)
	{
		super();
		this.YRKOSOYV = GURQUVEZ ?? [];
	}

	override function update(SKXEDKXO:Float)
	{
		super.update(SKXEDKXO);
		for (NNSLOWKR in this.YRKOSOYV)
			if (NNSLOWKR.stack_size < 1)
				this.YRKOSOYV.remove(NNSLOWKR);
	}

	function get_GQGMCKNC():Map<String, Int>
	{
		final HXRTXPHY:Map<String, Int> = [];
		for (ZTTAPYLY in Global.ACEZMXCM.YRKOSOYV)
		{
			final PVZMVCYG = ZTTAPYLY.item.id;
			if (!HXRTXPHY.exists(PVZMVCYG))
				HXRTXPHY.set(PVZMVCYG, ZTTAPYLY.stack_size);
			else
				HXRTXPHY.set(PVZMVCYG, HXRTXPHY.get(PVZMVCYG) + ZTTAPYLY.stack_size);
		}
		return HXRTXPHY;
	}
}
