import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final WSNKGMOC:Int = 20;
	public static final EEQIJHTE:Int = 15;

	override public function new()
	{
		super();
	}

	public function DSNEDVEA(NRQSCXYV:String, ?NMXBRRQE:String, ?UXMDLBEZ:Int = 4):World
	{
		var OJPPEHTH = 0;
		while (OJPPEHTH < WSNKGMOC * UXMDLBEZ)
		{
			final RIEUEJKZ = new SpriteBlock((OJPPEHTH < WSNKGMOC) ? NMXBRRQE ?? NRQSCXYV : NRQSCXYV);
			if (RIEUEJKZ.EDAKXEND != null)
				DDAWCSHK(RIEUEJKZ, OJPPEHTH + (WSNKGMOC * (EEQIJHTE - UXMDLBEZ)));
			OJPPEHTH++;
		}
		TMICKNXU();
		return this;
	}

	public function RBGSIGZB(FMVLTPOF:Float, CBNWFQCE:String, YDPTZJZA:String, XHQMRGGY:Int = 4):World
	{
		var GVOFJDNK = 0;
		while (GVOFJDNK < WSNKGMOC * XHQMRGGY)
		{
			final ODBFQGEK = new SpriteBlock((FlxG.random.bool(FMVLTPOF)) ? (YDPTZJZA ?? CBNWFQCE ?? null) : (CBNWFQCE ?? null));
			if (ODBFQGEK.EDAKXEND != null)
				DDAWCSHK(ODBFQGEK, GVOFJDNK + (WSNKGMOC * (EEQIJHTE - XHQMRGGY)));
			GVOFJDNK++;
		}
		TMICKNXU();
		return this;
	}

	public function TMICKNXU()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function EURYNUTR():World
	{
		var KWSUSHDN:World = new World();
		for (NUJBRSQL in this.members)
			KWSUSHDN.members.push(NUJBRSQL);
		return KWSUSHDN;
	}
}
