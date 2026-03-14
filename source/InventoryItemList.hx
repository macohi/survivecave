class InventoryItemList
{
	public static var UNKNOWN(default, never):InventoryItem = new InventoryItem('unknown', new Item('Unknown', 1), 9000, [['unknown' => 2]]);

	public static var ROCK(default, never):InventoryItem = new InventoryItem('rock', new Item('Rock', Item.GLOBAL_MAX_STACKSIZE), 1);
}
