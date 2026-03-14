package states.gui;

import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.FlxG;

class GUIMining extends StateGUI
{
	public var chanceIIs:Map<InventoryItem, Float> = [
		InventoryItemList.DIRT => 72,
		InventoryItemList.ROCK => 15,
		InventoryItemList.STONE => 27,
	];

	public var adding:Array<InventoryItem> = [];

	public var addingText:Text;

	override function create()
	{
		super.create();

		getItems();

		var player:SpritePlayer = new SpritePlayer();
		player.screenCenter();
		add(player);
		player.x = FlxG.width - player.width;

		final waitTime = 1.0 * (adding.length + 1 / 2);

		player.animation.play('walk');
		player.animation.timeScale = 1 * (waitTime * 0.5);

		trace(waitTime);
		trace(player.animation.timeScale);

		FlxTween.tween(player, {x: player.width}, waitTime);

		FlxTimer.wait(waitTime, function()
		{
			switchState(new StateCave());
		});

		for (i => item in adding)
			FlxTimer.wait(0.75 * (adding.length / (i + 1)), function()
			{
				addingText.text += '\n- ${item.stackSize} ${item.item.name}';
			});

		addingText = new Text('Receiving...');
		add(addingText);
		addingText.alignment = CENTER;
		addingText.size = 16;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		addingText.screenCenter();
		addingText.y = 10;
	}

	public function getItems()
	{
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
						adding.push(new InventoryItem(inventoryItem.graphic, inventoryItem.item, addedStackSize, inventoryItem.recipes));
				}
			}

			i++;
		}

		for (inventoryItem in adding)
			if (inventoryItem.stackSize < 1)
				adding.remove(inventoryItem);

		for (ii in adding)
		{
			if (ii.stackSize < 1)
			{
				adding.remove(ii);
				continue;
			}

			Global.INVENTORY.value.addInventoryItem(ii);

			trace('${ii.item.id} : ${ii.stackSize}');
		}
	}
}
