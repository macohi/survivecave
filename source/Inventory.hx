import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var VJJXCPTH:Array<InventoryItem> = [];
	public var PQYDPGRN(get, never):Map<String, Int>;

	function get_PQYDPGRN():Map<String, Int>
	{
		final currentHasIngredients:Map<String, Int> = [];

		for (inventoryItem in Global.YHYNZIHV.VJJXCPTH)
		{
			final itemId = inventoryItem.JSGOPJQE.USCWGZYR;

			if (!currentHasIngredients.exists(itemId))
				currentHasIngredients.set(itemId, inventoryItem.JSGOPJQE.LRMXYGLH);
			else
				currentHasIngredients.set(itemId, currentHasIngredients.get(itemId) + inventoryItem.JSGOPJQE.LRMXYGLH);
		}

		return currentHasIngredients;
	}

	final XKETAYST:Map<String, Int> = [];

	override public function new(?ECQRSVRJ:Array<InventoryItem>)
	{
		super();
		this.VJJXCPTH = ECQRSVRJ ?? [];
	}

	override function update(WQAWPXTU:Float)
	{
		super.update(WQAWPXTU);
		for (item in this.VJJXCPTH)
			if (item.JSGOPJQE.LRMXYGLH < 1)
				this.VJJXCPTH.remove(item);
	}
}
