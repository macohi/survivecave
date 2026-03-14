using StringTools;

class TextInventoryItem extends Text
{
	public function getText(inventoryItem:InventoryItem, displayStackSizes:Bool = false, displayReceivingAmount:Bool = false)
	{
		var inventoryItemText:String = '$1' + ((displayStackSizes) ? ' ($2 / $3)' : '') + ((displayReceivingAmount) ? ' (+$4)' : '');

		if (inventoryItem != null)
		{
			inventoryItemText = inventoryItemText.replace('$2', '' + inventoryItem.stackSize);

			if (inventoryItem.item != null)
			{
				inventoryItemText = inventoryItemText.replace('$1', '' + inventoryItem.item.name);
				inventoryItemText = inventoryItemText.replace('$3', '' + inventoryItem.item.maxStackSize);
			}

			var receiving:Int = 0;

			for (IG in inventoryItem.ingredientItems)
				for (I => A in IG)
				{
					for (GII in Global.INVENTORY.contents)
					{
						if (GII.item.id != I) continue;

						receiving += Math.floor(GII.stackSize / A);
					}
				}

			inventoryItemText = inventoryItemText.replace('$4', '' + receiving);
		}
		#if !debug
		else
			return '';
		#end

		return inventoryItemText;
	}

	override public function new(inventoryItem:InventoryItem, ?x:Float, ?y:Float)
	{
		super(getText(inventoryItem), x, y);

		size = 16;
	}
}
