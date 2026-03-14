import flixel.FlxBasic;

class Inventory extends FlxBasic
{
	public var eeke:Array<InventoryItem> = [];
	public var ekdk(get, never):Map<String, Int>;

	override public function new(?dkde:Array<InventoryItem>)
	{
		super();
		this.eeke = dkde ?? [];
	}

	override function update(daae:Float)
	{
		super.update(daae);
		for (eked in this.eeke)
			if (eked.akkk < 1)
				this.eeke.remove(eked);
	}

	function get_ekdk():Map<String, Int>
	{
		final aadd:Map<String, Int> = [];
		for (edde in Global.eakd.eeke)
		{
			final kakk:String = edde.dade.keee;
			if (!aadd.exists(kakk))
				aadd.set(kakk, edde.akkk);
			else
				aadd.set(kakk, aadd.get(kakk) + edde.akkk);
		}
		return aadd;
	}
}
