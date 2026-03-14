class Global
{
	public static var INVENTORY:Inventory;

	public static var ITEM_LIST:Inventory;

	public static var LAST_GAMEPLAY_STATE:Int = 0;

	public static function init()
	{
		ITEM_LIST = new Inventory([]);

		for (item in Reflect.fields(InventoryItemList))
		{
			if (!Reflect.isFunction(Reflect.field(InventoryItemList, item)))
			{
				trace(item);

				try
				{
					var inventoryItem:InventoryItem = cast Reflect.field(InventoryItemList, item);

					if (inventoryItem != null)
						ITEM_LIST.addInventoryItem(inventoryItem);
				}
				catch (e)
				{
					trace(e);
				}
			}
		}

		INVENTORY = new Inventory([]);

		trace(ITEM_LIST.contents.length + ' items');

		LAST_GAMEPLAY_STATE = -1;
	}
}
