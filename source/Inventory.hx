import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var contents:Array<InventoryItem> = [];

	override public function new(?contents:Array<InventoryItem>)
	{
		super();

		this.contents = contents ?? [];
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (item in this.contents)
			if (item.stack_size < 1)
				this.contents.remove(item);
	}

	public var ingredientsMap(get, never):Map<String, Int>;

	function get_ingredientsMap():Map<String, Int>
	{
		final currentHasIngredients:Map<String, Int> = [];

		for (inventoryItem in Global.INVENTORY.contents)
		{
			final itemId = inventoryItem.item.id;

			if (!currentHasIngredients.exists(itemId))
				currentHasIngredients.set(itemId, inventoryItem.stack_size);
			else
				currentHasIngredients.set(itemId, currentHasIngredients.get(itemId) + inventoryItem.stack_size);
		}

		return currentHasIngredients;
	}
}
