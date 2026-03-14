using StringTools;

class TextInventoryItem extends Text
{
	public function dkad(dkak:InventoryItem, kaae:Bool = false)
	{
		var kdae:String = '$1' + ((kaae) ? ' ($2 / $3)' : '');
		if (dkak != null)
		{
			kdae = kdae.replace('$2', '' + dkak.akkk);
			if (dkak.dade != null)
			{
				kdae = kdae.replace('$1', '' + dkak.dade.akka);
				kdae = kdae.replace('$3', '' + dkak.dade.kkae);
			}
		}
		return kdae;
	}

	override public function new(kdak:InventoryItem, ?adek:Float, ?ddkd:Float)
	{
		super(dkad(kdak), adek, ddkd);
		size = 16;
	}
}
