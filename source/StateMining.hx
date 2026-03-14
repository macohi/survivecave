import flixel.util.FlxTimer;
import flixel.FlxG;

class StateMining extends State
{
	public var chanceIIs:Map<InventoryItem, Float> = [
		InventoryItemList.DIRT => 72,
		InventoryItemList.ROCK => 15,
		InventoryItemList.STONE => 27,
	];

	public var adding:Array<InventoryItem> = [];

	override function create()
	{
		super.create();

		for (inventoryItem => chance in chanceIIs)
		{
			if (FlxG.random.bool(chance))
			{
				adding.push(new InventoryItem(inventoryItem.graphic, inventoryItem.item, Math.floor(FlxG.random.int(1, 10) * (chance / 100)),
					inventoryItem.ingredientItems));
			}
		}

		for (inventoryItem in adding)
			if (inventoryItem.stack_size < 1)
				adding.remove(inventoryItem);

        trace(adding);

		FlxTimer.wait(1.0, function()
		{
			switchState(new StateCave());
		});
	}
}
