import lime.app.Application;
import flixel.FlxG;

class Global
{
	public static var SAVE_SLOT:String = 'world1';

	public static var INVENTORY:SaveField<Inventory>;
	public static var LAST_GAMEPLAY_STATE:SaveField<Int>;

	static function changeSAVESLOT(nss:String)
	{
		SAVE_SLOT = nss;

		if (!FlxG.save.isBound)
			Application.current.onExit.add(function(i)
			{
				INVENTORY.value = INVENTORY.value;
				LAST_GAMEPLAY_STATE.value = LAST_GAMEPLAY_STATE.value;

				FlxG.save.flush();
			});

		FlxG.save.bind(SAVE_SLOT, Application.current.meta.get('company') + '/survivecave');

		if (FlxG.save.data == null)
		{
			FlxG.save.erase();
			changeSAVESLOT(nss);
			
			return;
		}

		trace('Save slot $nss');

		INVENTORY = new SaveField<Inventory>('inventory', new Inventory([]), 'Inventory');
		LAST_GAMEPLAY_STATE = new SaveField<Int>('last-gameplay-state', -1, 'Last Gameplay State');

		trace(FlxG.save.data);
	}

	public static var ITEM_LIST:Inventory;

	public static function init()
	{
		changeSAVESLOT('world1');

		getItemList();

		trace(ITEM_LIST.contents.length + ' items');

		if (INVENTORY.value != null)
			trace(INVENTORY.value.contents.length + ' inventory items');
	}

	static function getItemList()
	{
		ITEM_LIST = new Inventory([]);

		for (item in Reflect.fields(InventoryItemList))
		{
			if (!Reflect.isFunction(Reflect.field(InventoryItemList, item)))
			{
				try
				{
					if (!Std.isOfType(Reflect.field(InventoryItemList, item), InventoryItem))
						continue;

					var inventoryItem:InventoryItem = Reflect.field(InventoryItemList, item);
					trace(inventoryItem);

					ITEM_LIST.addInventoryItem(inventoryItem);
				}
				catch (e)
				{
					trace(e);
				}
			}
		}
		ITEM_LIST.removeItem('unknown', null);
	}
}
