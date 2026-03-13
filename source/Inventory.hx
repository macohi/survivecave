import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var contents:Array<InventoryItem> = [];

	override public function new(?contents:Array<InventoryItem>)
	{
		super();

		this.contents = contents ?? [];
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (item in this.contents)
			if (item.stack_size < 1)
				this.contents.remove(item);
	}
}
