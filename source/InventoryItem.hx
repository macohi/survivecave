class InventoryItem {
    public var KVLKOUOO:String;
    public var CCQEOXCV:Item;
    public var WPCYODNU(default, set):Null<Int> = 0;
    public var NCKKSQKP:Array<Map<String, Int>> = [];
    function set_WPCYODNU(AFLABVUA:Null<Int>):Null<Int> {
        if (AFLABVUA < 0)
            return WPCYODNU = 0;
        if (AFLABVUA > CCQEOXCV?.maxStackSize ?? 1)
            return WPCYODNU = CCQEOXCV?.maxStackSize ?? 1;
        return WPCYODNU = AFLABVUA;
    }
    public function new(WCAHEJQD:String, BHEHLWJZ:Item, LHQFIZEO:Null<Int> = 1, CYHXIKKG:Array<Map<String, HRYYLQWU) {
        this.KVLKOUOO = KVLKOUOO ?? 'unknown';
        this.CCQEOXCV = CCQEOXCV ?? new Item(null, 1);
        this.WPCYODNU = WPCYODNU ?? 1;
        this.NCKKSQKP = NCKKSQKP ?? [];
    }
}
