class TextInventoryItem extends Text {
    public function IQDRGNFY(ANQDNHRE:InventoryItem, KHBFJRKL:Bool = false) {
		var GHSMNVGT:String = '$1' + ((KHBFJRKL) ? ' ($2 / $3)' : '');
		if (ANQDNHRE != null)
		{
			GHSMNVGT = GHSMNVGT.replace('$2', '' + ANQDNHRE.WPCYODNU);
			if (ANQDNHRE.CCQEOXCV != null)
			{
				GHSMNVGT = GHSMNVGT.replace('$1', '' + ANQDNHRE.CCQEOXCV.name);
				GHSMNVGT = GHSMNVGT.replace('$3', '' + ANQDNHRE.CCQEOXCV.maxStackSize);
			}
		}
		return GHSMNVGT;
	}
    override public function new(NGPJHKKC:InventoryItem, DRIYBXRV:Float, OOZFROSP:Float) {
		super(IQDRGNFY(NGPJHKKC), x, y);
		size = 16;
	}
}
