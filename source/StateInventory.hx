import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var failedItemIDs:Array<String> = [];

	override function create()
	{
		super.create();

		createBackdrops();

		createLists();

		final currentHasIngredients = Global.INVENTORY.value.ingredientsMap;

		trace(currentHasIngredients);
		for (inventoryItem in Global.ITEM_LIST.contents)
		{
			var hasfailed:Bool = false;

			for (i => ingredientGroups in inventoryItem.ingredientItems)
			{
				if (hasfailed)
					continue;

				var cril = 0;
				var passed = 0;

				for (itemId => itemStack in ingredientGroups)
				{
					cril++;

					if (currentHasIngredients.exists(itemId))
						if (currentHasIngredients.get(itemId) >= itemStack)
							passed++;

					if (passed < cril)
					{
						hasfailed = true;
						failedItemIDs.push(inventoryItem.item.id);

						trace('${inventoryItem.item.id} : ${inventoryItem.ingredientItems[i]}');
					}
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		applyControls();

		updateLists();
	}

	public final MAX_TEXTS:Int = 14;

	public function applyControls()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.LAST_GAMEPLAY_STATE.value == 2)
				switchState(new StateCave());
			else
				switchState(new StateGame());
		}

		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			curSelect--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			curSelect++;
		}

		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				itemListOffset--;
			else
				inventoryOffset--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				itemListOffset++;
			else
				inventoryOffset++;
		}

		if (FlxG.keys.anyJustReleased([TAB]))
		{
			curSelect = 0;
			inventoryTab = !inventoryTab;
		}

		if (curSelect < 0)
		{
			curSelect = MAX_TEXTS;

			if (inventoryTab)
				inventoryOffset--;
			else
				itemListOffset--;
		}
		if (curSelect > MAX_TEXTS)
		{
			curSelect = 0;

			if (inventoryTab)
				inventoryOffset++;
			else
				itemListOffset++;
		}

		if (curSelect > Global.INVENTORY.value.contents.length - 1 && inventoryTab)
			curSelect = Global.INVENTORY.value.contents.length - 1;
		if (curSelect > Global.ITEM_LIST.contents.length - 1 && !inventoryTab)
			curSelect = Global.ITEM_LIST.contents.length - 1;

		if ((inventoryOffset + MAX_TEXTS) < 0)
			inventoryOffset = Global.INVENTORY.value.contents.length;
		if ((inventoryOffset + MAX_TEXTS) > Global.INVENTORY.value.contents.length)
			inventoryOffset = 0;

		if ((itemListOffset + MAX_TEXTS) < 0)
			itemListOffset = Global.ITEM_LIST.contents.length;
		if ((itemListOffset + MAX_TEXTS) > Global.ITEM_LIST.contents.length)
			itemListOffset = 0;

		curSelect = FlxMath.absInt(curSelect);
		inventoryOffset = FlxMath.absInt(inventoryOffset);
		itemListOffset = FlxMath.absInt(inventoryOffset);

		FlxG.watch.addQuick('curSelect', curSelect);
		FlxG.watch.addQuick('inventoryOffset', inventoryOffset);
		FlxG.watch.addQuick('itemListOffset', itemListOffset);

		if (FlxG.keys.anyJustReleased([ENTER]))
		{
			if (inventoryTab)
				return;

			final curItem = Global.ITEM_LIST.contents[curSelect + itemListOffset];

			if (failedItemIDs.contains(curItem?.item?.id))
				return;

			for (ingredientGroup in curItem.ingredientItems)
			{
				for (ingredient => amount in ingredientGroup)
					Global.INVENTORY.value.removeItem(ingredient, amount);
			}
		}
	}

	public var textgrp_inventory:TextGroup;
	public var textgrp_items:TextGroup;

	public function createLists()
	{
		textgrp_inventory = new TextGroup(backdrop_side_left.x, backdrop_side_left.y);
		textgrp_items = new TextGroup(backdrop_side_right.x, backdrop_side_right.y);

		add(textgrp_inventory);
		add(textgrp_items);

		final textYMult = 32;

		for (i => item in Global.ITEM_LIST.contents)
		{
			if (i > MAX_TEXTS)
				continue;

			var itemText:TextInventoryItem = new TextInventoryItem(item, 0, i * textYMult);
			itemText.ID = i;

			textgrp_items.add(itemText);
		}

		for (i => item in Global.INVENTORY.value.contents)
		{
			if (i > MAX_TEXTS)
				continue;

			var itemText:TextInventoryItem = new TextInventoryItem(item, 0, i * textYMult);
			itemText.ID = i;

			textgrp_inventory.add(itemText);
		}
	}

	public var curSelect:Int = 0;

	public var inventoryTab:Bool = true;

	public var inventoryOffset:Int = 0;
	public var itemListOffset:Int = 0;

	public function updateLists()
	{
		for (text in textgrp_items.members)
		{
			var textInvItem:TextInventoryItem = cast text;

			final curItem = Global.ITEM_LIST.contents[textInvItem.ID + itemListOffset];

			if (failedItemIDs.contains(curItem?.item?.id))
				textInvItem.setColorTransform(0.75, 0.75, 0.75);
			else
				textInvItem.setColorTransform(1.00, 1.00, 1.00);

			if (curSelect == textInvItem.ID && !inventoryTab)
				textInvItem.colorTransform.blueMultiplier = 0;

			textInvItem.visible = curItem != null;

			textInvItem.text = textInvItem.getText(curItem, false, true) + #if DISPLAY_INVENTORY_OFFSETS ' (+$itemListOffset)' #else '' #end;
		}

		for (text in textgrp_inventory.members)
		{
			var textInvItem:TextInventoryItem = cast text;

			textInvItem.color = FlxColor.WHITE;
			if (curSelect == textInvItem.ID && inventoryTab)
				textInvItem.color = FlxColor.YELLOW;

			final curItem = Global.INVENTORY.value.contents[textInvItem.ID + itemListOffset];

			textInvItem.visible = curItem != null;
			textInvItem.text = textInvItem.getText(curItem, true, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$inventoryOffset)' #else '' #end;
		}
	}

	var backdrop = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));

	var backdrop_side_left = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var backdrop_side_right = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	public function createBackdrops()
	{
		backdrop.scale.set(FlxG.width / 2, FlxG.height / 2);
		backdrop_side_left.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		backdrop_side_right.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);

		backdrop.updateHitbox();
		backdrop_side_left.updateHitbox();
		backdrop_side_right.updateHitbox();

		backdrop.screenCenter();
		backdrop_side_left.screenCenter();
		backdrop_side_right.screenCenter();

		backdrop_side_right.y = backdrop_side_left.y += 3;

		backdrop_side_left.x = 10;
		backdrop_side_right.x = FlxG.width - backdrop_side_right.width - 10;

		addToLayer(backdrop, 1);
		addToLayer(backdrop_side_left);
		addToLayer(backdrop_side_right);
	}
}
