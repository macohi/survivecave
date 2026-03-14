package objects;

class InventoryItem
{
	public var graphic:String;

	public var item:Item;

	public var stackSize(default, set):Null<Int> = 0;

	function set_stackSize(ss:Null<Int>):Null<Int>
	{
		if (ss < 0)
			return stackSize = 0;

		if (ss > item?.maxStackSize ?? 1)
			return stackSize = item?.maxStackSize ?? 1;

		return stackSize = ss;
	}

	public var recipes:RecipeMap = [];

	public function new(?graphic:String, ?item:Item, ?stackSize:Null<Int> = 1, ?recipes:RecipeMap)
	{
		this.graphic = graphic ?? 'unknown';
		this.item = item ?? new Item(null, 1);
		this.stackSize = stackSize ?? 1;
		this.recipes = recipes ?? [];
	}

	public function toString():String
	{
		return '${item.id}=' + {
			graphic: this.graphic,
			stack_size: this.stackSize,
			recipes: this.recipes,
			max_stack_size: this.item.maxStackSize,
			name: this.item.name,
		};
	}
}
