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
			if (item.stackSize < 1)
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
				currentHasIngredients.set(itemId, inventoryItem.stackSize);
			else
				currentHasIngredients.set(itemId, currentHasIngredients.get(itemId) + inventoryItem.stackSize);
		}

		return currentHasIngredients;
	}

	public function addInventoryItem(newInventoryItem:InventoryItem)
	{
		var appendedItem:Bool = false;

		for (inventoryItem in contents)
		{
			if (appendedItem
				|| inventoryItem.item.id != newInventoryItem.item.id
				|| inventoryItem.stackSize > inventoryItem.item.maxStackSize)
				continue;

			appendedItem = true;
			inventoryItem.stackSize += newInventoryItem.stackSize;
		}

		if (!appendedItem)
			contents.push(newInventoryItem);
	}

	public function removeItem(ingredient:String, amount:Null<Int>)
	{
		for (inventoryItem in contents)
		{
			if (inventoryItem.item.id != ingredient)
				continue;

			if (amount == null)
			{
				contents.remove(inventoryItem);
				return;
			}

			inventoryItem.stackSize -= amount;

			if (inventoryItem.stackSize < 1)
				contents.remove(inventoryItem);

			return;
		}
	}
}
