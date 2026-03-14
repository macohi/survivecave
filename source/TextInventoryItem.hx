using StringTools;

class TextInventoryItem extends Text
{
	public function GXKHWRHF(CYKBADIU:InventoryItem, SUEYOEGH:Bool = false)
	{
		var FGBGJPMD:String = '$1' + ((SUEYOEGH) ? ' ($2 / $3)' : '');
		if (CYKBADIU != null)
		{
			FGBGJPMD = FGBGJPMD.replace('$2', '' + CYKBADIU.URQSDQXH);
			if (CYKBADIU.QFKSAJOY != null)
			{
				FGBGJPMD = FGBGJPMD.replace('$1', '' + CYKBADIU.QFKSAJOY.KPHIBLKB);
				FGBGJPMD = FGBGJPMD.replace('$3', '' + CYKBADIU.QFKSAJOY.AHPGHSIC);
			}
		}
		return FGBGJPMD;
	}

	override public function new(XJDGJENO:InventoryItem, ?KLFJXSKL:Float, ?EWLUINFF:Float)
	{
		super(GXKHWRHF(XJDGJENO), KLFJXSKL, EWLUINFF);
		size = 16;
	}
}
