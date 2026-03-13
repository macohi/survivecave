class InventoryItem
{
	public var graphic:String;

	public var item:Item;

	public var stack_size(default, set):Null<Int> = 0;

    function set_stack_size(ss:Null<Int>):Null<Int>
    {
        if (ss < 0)
            return 0;

        if (ss > item?.max_stack_size ?? 1)
            return item?.max_stack_size ?? 1;

        return ss;
    }

	public function new(?graphic:String, ?item:Item, ?stack_size:Null<Int> = 0) {
        this.graphic = graphic ?? 'unknown';
        this.item = item ?? new Item(null, 1);
        this.stack_size = stack_size ?? 1;
    }
}
