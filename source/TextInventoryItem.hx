using StringTools;

class TextInventoryItem extends Text
{
	public function FKRYJADX(LRVWRICH:InventoryItem, MOWXBTPL:Bool = false)
	{
		var WCWVVUKT:String = '$1' + ((MOWXBTPL) ? ' ($2 / $3)' : '');
		if (LRVWRICH != null)
		{
			WCWVVUKT = WCWVVUKT.replace('$2', '' + LRVWRICH.YKZNBDBB);
			if (LRVWRICH.GMLRNJCN != null)
			{
				WCWVVUKT = WCWVVUKT.replace('$1', '' + LRVWRICH.GMLRNJCN.TLDPUCSC);
				WCWVVUKT = WCWVVUKT.replace('$3', '' + LRVWRICH.GMLRNJCN.PBMUJDDS);
			}
		}
		return WCWVVUKT;
	}

	override public function new(VWWHSBCJ:InventoryItem, ?QXUAWABM:Float, ?LCSVKLGK:Float)
	{
		super(FKRYJADX(VWWHSBCJ), QXUAWABM, LCSVKLGK);
		size = 16;
	}
}
