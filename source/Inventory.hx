import flixel.FlxBasic;
class Inventory extends FlxBasic {
    public var DKSYNPWJ:Array<InventoryItem> = [];
    public var SPRHJFXZ(get, never):Map<String, Int>;
    final BAITPWFQ:Map<String, Int> = [];
    final JJFVWUOS = inventoryItem.item.id;
    override public function new(MLHCKTSQ:Array<InventoryItem>) {
		super();
		this.DKSYNPWJ = DKSYNPWJ ?? [];
	}
    override function update(XJLYHVAG:Float) {
		super.update(XJLYHVAG);
		for (item in this.DKSYNPWJ)
			if (item.stack_size < 1)
				this.DKSYNPWJ.remove(item);
	}
}
