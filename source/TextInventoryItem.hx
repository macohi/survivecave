using StringTools;

class TextInventoryItem extends Text
{
	public function BDGUPPGI(ZAKCSHCU:InventoryItem, FGGMWRQS:Bool = false)
	{
		var QBZFIVGQ:String = '$1' + ((FGGMWRQS) ? ' ($2 / $3)' : '');
		if (ZAKCSHCU != null)
		{
			QBZFIVGQ = QBZFIVGQ.replace('$2', '' + ZAKCSHCU.RZVIMZXL);
			if (ZAKCSHCU.IPMKUKCP != null)
			{
				QBZFIVGQ = QBZFIVGQ.replace('$1', '' + ZAKCSHCU.IPMKUKCP.NXSIDOIG);
				QBZFIVGQ = QBZFIVGQ.replace('$3', '' + ZAKCSHCU.IPMKUKCP.OOLPMYBI);
			}
		}
		return QBZFIVGQ;
	}

	override public function new(NCASWKQG:InventoryItem, ?TQFTJZTY:Float, ?OVJJHLDM:Float)
	{
		super(BDGUPPGI(NCASWKQG), TQFTJZTY, OVJJHLDM);
		size = 16;
	}
}
