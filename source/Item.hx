using StringTools;

class Item
{
	public var id:String = '';

	public var name:String;
	
	public var maxStackSize:Null<Int>;

	public static var GLOBAL_MAX_STACKSIZE:Int = 32;

	public function new(?name:String, ?maxStackSize:Null<Int>, ?id:String) {
		this.name = name ?? 'Unknown Item';
		this.maxStackSize = maxStackSize ?? 1;

		this.id = id ?? this.name.toLowerCase().trim().replace(' ', '-');
	}
}
