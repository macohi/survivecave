package states.gui;

import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxG;

class GUIInventory extends StateGUI
{
	public var failedItemIDs:Map<String, RecipeMap> = [];

	override function create()
	{
		super.create();

		createBackdrops();

		createLists();

		getFailedItemIDS();

		curSelect = SAVED_OFFSETS[0];
		inventoryOffset = SAVED_OFFSETS[1];
		itemListOffset = SAVED_OFFSETS[2];
		inventoryTab = SAVED_OFFSETS[3] == 1;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		applyControls();

		updateLists();
	}

	public final maxTexts:Int = 14;

	public function applyControls()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			SAVED_OFFSETS = [0, 0, 0, 1];

			if (Global.LAST_GAMEPLAY_STATE.value == 2)
				switchState(new StateCave());
			else
				switchState(new StateGround());
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
			curSelect = maxTexts;

			if (inventoryTab)
				inventoryOffset--;
			else
				itemListOffset--;
		}
		if (curSelect > maxTexts)
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

		if ((inventoryOffset + maxTexts) < 0)
			inventoryOffset = Global.INVENTORY.value.contents.length;
		if ((inventoryOffset + maxTexts) > Global.INVENTORY.value.contents.length)
			inventoryOffset = 0;

		if ((itemListOffset + maxTexts) < 0)
			itemListOffset = Global.ITEM_LIST.contents.length;
		if ((itemListOffset + maxTexts) > Global.ITEM_LIST.contents.length)
			itemListOffset = 0;

		curSelect = FlxMath.absInt(curSelect);
		inventoryOffset = FlxMath.absInt(inventoryOffset);
		itemListOffset = FlxMath.absInt(inventoryOffset);

		FlxG.watch.addQuick('curSelect', curSelect);
		FlxG.watch.addQuick('inventoryOffset', inventoryOffset);
		FlxG.watch.addQuick('itemListOffset', itemListOffset);

		SAVED_OFFSETS = [curSelect, inventoryOffset, itemListOffset, (inventoryTab ? 1 : 0)];

		if (FlxG.keys.justReleased.ENTER && !FlxG.keys.pressed.SHIFT)
		{
			final ogIL = Global.INVENTORY.value.contents.length;

			if (inventoryTab)
				return;

			final craftItem = Global.ITEM_LIST.contents[curSelect + itemListOffset];

			if (failedItemIDs.exists(craftItem?.item?.id))
				return;

			Global.INVENTORY.value.craftItem(craftItem);

			if (Global.INVENTORY.value.contents.length != ogIL)
				switchState(new GUIInventory());
			else
				getFailedItemIDS();
		}
	}

	public static var SAVED_OFFSETS:Array<Int> = [0, 0, 0, 1];

	public var inventoryTexts:GroupText;
	public var itemsListTexts:GroupText;

	public function createLists()
	{
		if (inventoryTexts != null)
		{
			remove(inventoryTexts);
			inventoryTexts.destroy();
		}
		if (itemsListTexts != null)
		{
			remove(itemsListTexts);
			itemsListTexts.destroy();
		}

		inventoryTexts = new GroupText(backdropLeftSide.x, backdropLeftSide.y);
		itemsListTexts = new GroupText(backdropRightSide.x, backdropRightSide.y);

		add(inventoryTexts);
		add(itemsListTexts);

		final textYMult = 32;

		for (i => item in Global.ITEM_LIST.contents)
		{
			if (i > maxTexts)
				continue;

			var itemText:TextInventoryItem = new TextInventoryItem(item, 0, i * textYMult);
			itemText.ID = i;

			itemsListTexts.add(itemText);
		}

		for (i => item in Global.INVENTORY.value.contents)
		{
			if (i > maxTexts)
				continue;

			var itemText:TextInventoryItem = new TextInventoryItem(item, 0, i * textYMult);
			itemText.ID = i;

			inventoryTexts.add(itemText);
		}
	}

	public var curSelect:Int = 0;

	public var inventoryTab:Bool = true;

	public var inventoryOffset:Int = 0;
	public var itemListOffset:Int = 0;

	public function updateLists()
	{
		for (text in itemsListTexts.members)
		{
			var textInvItem:TextInventoryItem = cast text;

			final curItem:InventoryItem = Global.ITEM_LIST.contents[textInvItem.ID + itemListOffset];

			if (failedItemIDs.exists(curItem?.item?.id) || curItem.recipes.length < 1)
				textInvItem.setColorTransform(0.75, 0.75, 0.75);
			else
				textInvItem.setColorTransform(1.00, 1.00, 1.00);

			if (curSelect == textInvItem.ID && !inventoryTab)
				textInvItem.colorTransform.blueMultiplier = 0;

			textInvItem.visible = curItem != null;

			textInvItem.text = textInvItem.getText(curItem, false, true) + #if DISPLAY_INVENTORY_OFFSETS ' (+$itemListOffset)' #else '' #end;
		}

		for (text in inventoryTexts.members)
		{
			var textInvItem:TextInventoryItem = cast text;

			textInvItem.color = FlxColor.WHITE;
			if (curSelect == textInvItem.ID && inventoryTab)
				textInvItem.color = FlxColor.YELLOW;

			final curItem:InventoryItem = Global.INVENTORY.value.contents[textInvItem.ID + itemListOffset];

			textInvItem.visible = curItem != null;
			textInvItem.text = textInvItem.getText(curItem, true, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$inventoryOffset)' #else '' #end;
		}
	}

	var backdrop = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));

	var backdropLeftSide = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var backdropRightSide = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	public function createBackdrops()
	{
		backdrop.scale.set(FlxG.width / 2, FlxG.height / 2);
		backdropLeftSide.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		backdropRightSide.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);

		backdrop.updateHitbox();
		backdropLeftSide.updateHitbox();
		backdropRightSide.updateHitbox();

		backdrop.screenCenter();
		backdropLeftSide.screenCenter();
		backdropRightSide.screenCenter();

		backdropRightSide.y = backdropLeftSide.y += 3;

		backdropLeftSide.x = 10;
		backdropRightSide.x = FlxG.width - backdropRightSide.width - 10;

		addToLayer(backdrop, 1);
		addToLayer(backdropLeftSide);
		addToLayer(backdropRightSide);
	}

	public function getFailedItemIDS()
	{
		final recipeMap = Global.INVENTORY.value.recipeMap;

		trace('- - - -');
		trace('recipeMap' + recipeMap);

		for (inventoryItem in Global.ITEM_LIST.contents)
		{
			var hasfailed:Bool = false;

			for (i => recipe in inventoryItem.recipes)
			{
				if (hasfailed)
					continue;

				var cril = 0;
				var passed = 0;

				for (itemId => itemStack in recipe)
				{
					cril++;

					if (recipeMap.exists(itemId))
						if (recipeMap.get(itemId) >= itemStack)
							passed++;
				}

				if (passed < cril)
				{
					hasfailed = true;

					if (!failedItemIDs.exists(inventoryItem.item.id))
						failedItemIDs.set(inventoryItem.item.id, [recipe]);
					else
						failedItemIDs.get(inventoryItem.item.id).push(recipe);

					trace('FAILED ITEM IDS: ${inventoryItem.item.id} : ${inventoryItem.recipes[i]}');
				}
			}
		}
	}
}
