class Item
{
	public var name:String;
	
	public var graphic:String;

	public var max_stack:Int;

	public function new(?graphic:String, ?name:String, ?max_stack:Int) {
		this.name = name ?? 'Unknown Item';
		this.max_stack = max_stack ?? 10;

		this.graphic = graphic ?? 'unknown';
	}
}
