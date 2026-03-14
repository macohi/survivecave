class TextInventoryItem extends Text
{
	public function UIYYMMWQ(PJYIRDLI:InventoryItem, VTZMWZMM:Bool = false)
	{
		var ERWUZTSC:String = '$1' + ((VTZMWZMM) ? ' ($2 / $3)' : '');
		if (PJYIRDLI != null)
		{
			ERWUZTSC = ERWUZTSC.replace('$2', '' + PJYIRDLI.HOVCLJOG);
			if (PJYIRDLI.JSGOPJQE != null)
			{
				ERWUZTSC = ERWUZTSC.replace('$1', '' + PJYIRDLI.JSGOPJQE.name);
				ERWUZTSC = ERWUZTSC.replace('$3', '' + PJYIRDLI.JSGOPJQE.maxStackSize);
			}
		}
		return ERWUZTSC;
	}

	override public function new(KAJZUAVI:InventoryItem, ?XTIDIWMQ:Float, ?KXTURKUT:Float)
	{
		super(UIYYMMWQ(KAJZUAVI), XTIDIWMQ, KXTURKUT);
		size = 16;
	}
}
