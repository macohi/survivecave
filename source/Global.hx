class Global
{
	public static var INVENTORY:Inventory;

	public static var ITEM_LIST:Inventory;

	public static var LAST_GAMEPLAY_STATE:Int = 0;

	public static function init()
	{
		ITEM_LIST = new Inventory([
			InventoryItemList.UNKNOWN,
			InventoryItemList.ROCK,
		]);
		INVENTORY = new Inventory(ITEM_LIST.contents);

		trace(ITEM_LIST.contents.length + ' items');

		LAST_GAMEPLAY_STATE = -1;
	}
}
