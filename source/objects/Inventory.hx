package objects;

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

	public var recipeMap(get, never):Recipe;

	function get_recipeMap():Recipe
	{
		final curRecipe:Recipe = [];

		for (inventoryItem in Global.INVENTORY.value.contents)
		{
			final itemId = inventoryItem.item.id;

			if (!curRecipe.exists(itemId))
				curRecipe.set(itemId, inventoryItem.stackSize);
			else
				curRecipe.set(itemId, curRecipe.get(itemId) + inventoryItem.stackSize);
		}

		return curRecipe;
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

	public function removeItem(item:String, amount:Null<Int>)
	{
		for (inventoryItem in contents)
		{
			if (inventoryItem.item.id != item)
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

	public function getItem(wantedID:String):InventoryItem
	{
		for (inventoryItem in contents)
			if (inventoryItem.item.id == wantedID)
				return inventoryItem;

		return null;
	}

	public function craftItem(itemToCraft:InventoryItem)
	{
		var recipePasses:Array<Bool> = [];

		for (recipe in itemToCraft.recipes)
		{
			var has:Int = 0;
			var recipeLen:Int = 0;

			for (itm => amt in recipe)
			{
				if (getItem(itm) != null)
					if (getItem(itm).stackSize >= amt)
						has++;

				recipeLen++;
			}

			recipePasses.push(has == recipeLen);
		}

		var recipeToUse:Recipe = itemToCraft.recipes[recipePasses.indexOf(true)];

		if (recipeToUse == null) return;

		trace('Crafting ${itemToCraft.item.id} using $recipeToUse');

		for (ingredient => amount in recipeToUse)
		{
			removeItem(ingredient, amount);
			trace(' * Removed $amount $ingredient');
		}

		addInventoryItem(itemToCraft);
	}
}
