class Inventory
{
	public var contents:Array<InventoryItem> = [];

	public function new(?contents:Array<InventoryItem>)
	{
		this.contents = contents ?? [];
	}
}
