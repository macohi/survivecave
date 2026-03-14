using StringTools;

class TextInventoryItem extends Text
{
	public function getText(inventoryItem:InventoryItem, displayStackSizes:Bool = false)
	{
		var inventoryItemText:String = '$1' + ((displayStackSizes) ? ' ($2 / $3)' : '');

		if (inventoryItem != null)
		{
			inventoryItemText = inventoryItemText.replace('$2', '' + inventoryItem.stack_size);

			if (inventoryItem.item != null)
			{
				inventoryItemText = inventoryItemText.replace('$1', '' + inventoryItem.item.name);
				inventoryItemText = inventoryItemText.replace('$3', '' + inventoryItem.item.maxStackSize);
			}
		}

		return inventoryItemText;
	}

	override public function new(inventoryItem:InventoryItem, ?x:Float, ?y:Float)
	{
		super(getText(inventoryItem), x, y);

		size = 16;
	}
}
