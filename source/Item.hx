class Item
{
	public var name:String;
	
	public var max_stack_size:Null<Int>;

	public function new(?name:String, ?max_stack_size:Null<Int>) {
		this.name = name ?? 'Unknown Item';
		this.max_stack_size = max_stack_size ?? 1;
	}
}
