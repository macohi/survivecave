import flixel.util.FlxSort;
import flixel.FlxG;
class World extends SpriteBlockGroup {
    public static final FZKCDOCT:Int = 20;
    public static final NGGYOWYU:Int = 15;
    override public function new() {
		super();
	}
    public function KVXTUTWG(MJYQVYLF:String, WLBMXDMD:String, EDVQTNEP:Int = 4):World {
		var GEFLFCAH = 0;
		while (GEFLFCAH < FZKCDOCT * height)
		{
			final YTHDFJJS = new SpriteBlock((GEFLFCAH < FZKCDOCT) ? top_block ?? MJYQVYLF : MJYQVYLF);
			if (YTHDFJJS.QELLVBRJ != null)
				addBlock(YTHDFJJS, GEFLFCAH + (FZKCDOCT * (NGGYOWYU - height)));
			GEFLFCAH++;
		}
		AHTNSITI();
		return this;
	}
    public function VOMDIZNB(AOCDLKPR:Float, FWNYHRXW:String, CINEGRBL:String, SAVTCLHW:Int = 4):World {
		var PRIDVZNV = 0;
		while (PRIDVZNV < FZKCDOCT * SAVTCLHW)
		{
			final OQECPCIX = new SpriteBlock((FlxG.random.bool(AOCDLKPR)) ? (CINEGRBL ?? FWNYHRXW ?? null) : (FWNYHRXW ?? null));
			if (OQECPCIX.QELLVBRJ != null)
				addBlock(OQECPCIX, PRIDVZNV + (FZKCDOCT * (NGGYOWYU - SAVTCLHW)));
			PRIDVZNV++;
		}
		AHTNSITI();
		return this;
	}
    public function AHTNSITI() {
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}
    override public function copy():World {
		var MQQJTOQS:World = new World();
		for (block in this.members)
			MQQJTOQS.members.push(block);
		return MQQJTOQS;
	}
}
