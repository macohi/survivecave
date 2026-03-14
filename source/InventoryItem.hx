class InventoryItem
{
	public var graphic:String;

	public var item:Item;

	public var stack_size(default, set):Null<Int> = 0;

    function set_stack_size(ss:Null<Int>):Null<Int>
    {
        if (ss < 0)
            return stack_size = 0;

        if (ss > item?.maxStackSize ?? 1)
            return stack_size = item?.maxStackSize ?? 1;

        return stack_size = ss;
    }
    
    public var ingredientItems:Array<Map<String, Int>> = [];

	public function new(?graphic:String, ?item:Item, ?stack_size:Null<Int> = 1, ?ingredientItems:Array<Map<String, Int>>) {
        this.graphic = graphic ?? 'unknown';
        this.item = item ?? new Item(null, 1);
        this.stack_size = stack_size ?? 1;
        this.ingredientItems = ingredientItems ?? [];
    }
}
