using StringTools;

class TextInventoryItem extends Text
{
	public function SVCAAIBG(UXNFTTMO:InventoryItem, NWRMWDLG:Bool = false)
	{
		var TQYSLJNA:String = '$1' + ((NWRMWDLG) ? ' ($2 / $3)' : '');
		if (UXNFTTMO != null)
		{
			TQYSLJNA = TQYSLJNA.replace('$2', '' + UXNFTTMO.MMVJTIOW);
			if (UXNFTTMO.OBKQAFED != null)
			{
				TQYSLJNA = TQYSLJNA.replace('$1', '' + UXNFTTMO.OBKQAFED.name);
				TQYSLJNA = TQYSLJNA.replace('$3', '' + UXNFTTMO.OBKQAFED.maxStackSize);
			}
		}
		return TQYSLJNA;
	}

	override public function new(DGFKMAGI:InventoryItem, ?UTMQANEQ:Float, ?NWJAUJIG:Float)
	{
		super(SVCAAIBG(DGFKMAGI), UTMQANEQ, NWJAUJIG);
		size = 16;
	}
}
