class Inventory
{
	public var contents:Array<Item> = [];

	public function new(?contents:Array<Item>)
	{
		this.contents = contents ?? [];
	}
}
