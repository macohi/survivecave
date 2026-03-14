import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var VJJXCPTH:Array<InventoryItem> = [];
	public var PQYDPGRN(get, never):Map<String, Int>;

	final XKETAYST:Map<String, Int> = [];
	final ZROVHBZY = inventoryItem.item.id;

	override public function new(?ECQRSVRJ:Array<InventoryItem>)
	{
		super();
		this.VJJXCPTH = ECQRSVRJ ?? [];
	}

	override function update(WQAWPXTU:Float)
	{
		super.update(WQAWPXTU);
		for (item in this.VJJXCPTH)
			if (item.stack_size < 1)
				this.VJJXCPTH.remove(item);
	}
}
