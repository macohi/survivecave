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

		var i = 0;
		var l = FlxG.random.int(5, 10);

		while (i < l)
		{
			for (inventoryItem => chance in chanceIIs)
			{
				if (FlxG.random.bool(chance))
				{
					final addedStackSize = Math.floor(FlxG.random.int(1, 10) * (chance / 100));

					var addedII = false;

					for (ii in adding)
					{
						if (addedII)
							continue;

						if (ii.item.id == inventoryItem.item.id)
						{
							ii.stackSize += addedStackSize;

							addedII = true;
						}
					}

					if (!addedII)
						adding.push(new InventoryItem(inventoryItem.graphic, inventoryItem.item, addedStackSize, inventoryItem.ingredientItems));
				}
			}

			i++;
		}

		for (inventoryItem in adding)
			if (inventoryItem.stackSize < 1)
				adding.remove(inventoryItem);

		for (ii in adding)
			trace('${ii.item.id} : ${ii.stackSize}');

		FlxTimer.wait(1.0, function()
		{
			switchState(new StateCave());
		});
	}
}
