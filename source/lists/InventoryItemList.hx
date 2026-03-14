package lists;

class InventoryItemList
{
	public static final UNKNOWN:InventoryItem = generateInventoryItem('unknown', 'Unknown', [['unknown' => 2]], 9000);

	public static final ROCK:InventoryItem = generateInventoryItem('rock', 'Rock', [['stone' => 1]]);
	public static final STONE:InventoryItem = generateInventoryItem('stone', 'Stone', null);

	public static final DIRT:InventoryItem = generateInventoryItem('dirt', 'Dirt', null);

	public static final SAPLING:InventoryItem = generateInventoryItem('sapling', 'Sapling', [['dirt' => 2, 'dirt-seed' => 2]]);
	public static final DIRT_SEED:InventoryItem = generateInventoryItem('dirt-seed', 'Dirt Seed', [['dirt' => 4]]);

	public static function generateInventoryItem(graphic:String, name:String, ?ingredientItems:Array<Map<String, Int>>, ?maxStackSize:Null<Int>, ?id:String)
	{
		return new InventoryItem(graphic, new Item(name, maxStackSize ?? Item.GLOBAL_MAX_STACKSIZE, id), ingredientItems ?? []);
	}
}
