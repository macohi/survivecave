import flixel.util.FlxColorTransformUtil;
import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var currentHasIngredients:Map<String, Int> = [];

	override function create()
	{
		super.create();

		createBackdrops();

		createLists();

		currentHasIngredients = Global.INVENTORY.ingredientsMap;
		trace(currentHasIngredients);
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
			if (Global.LAST_GAMEPLAY_STATE == 2)
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

		if (curSelect > Global.INVENTORY.contents.length - 1)
			curSelect = 0;

		if (inventoryOffset < 0)
			inventoryOffset = Global.INVENTORY.contents.length - ((MAX_TEXTS * 1) + 1);
		if (inventoryOffset > Global.INVENTORY.contents.length - ((MAX_TEXTS * 1) + 1))
			inventoryOffset = 0;

		if (itemListOffset < 0)
			itemListOffset = Global.ITEM_LIST.contents.length - ((MAX_TEXTS * 1) + 1);
		if (itemListOffset > Global.ITEM_LIST.contents.length - ((MAX_TEXTS * 1) + 1))
			itemListOffset = 0;

		FlxG.watch.addQuick('curSelect', curSelect);
		FlxG.watch.addQuick('inventoryOffset', inventoryOffset);
		FlxG.watch.addQuick('itemListOffset', itemListOffset);
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

		for (i => item in Global.INVENTORY.contents)
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

			textInvItem.color = FlxColor.WHITE;
			if (curSelect == textInvItem.ID && !inventoryTab)
				textInvItem.color = FlxColor.YELLOW;

			final curItem = Global.ITEM_LIST.contents[textInvItem.ID + itemListOffset];

			var hasfailed:Bool = false;

			textInvItem.setColorTransform(1, 1, 1);
			
			for (ingredientGroups in curItem.ingredientItems)
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
						textInvItem.setColorTransform(0.75, 0.75, 0.75);
						hasfailed == true;
					}
				}
			}

			textInvItem.text = textInvItem.getText(curItem, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$itemListOffset)' #else '' #end;
		}

		for (text in textgrp_inventory.members)
		{
			var textInvItem:TextInventoryItem = cast text;

			textInvItem.color = FlxColor.WHITE;
			if (curSelect == textInvItem.ID && inventoryTab)
				textInvItem.color = FlxColor.YELLOW;

			textInvItem.text = textInvItem.getText(Global.INVENTORY.contents[textInvItem.ID + inventoryOffset], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$inventoryOffset)' #else '' #end;
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
