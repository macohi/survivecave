import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final ZSNJDPIO:Int = 20;
	public static final WCLMIURN:Int = 15;

	override public function new()
	{
		super();
	}

	public function YZBTMTDS(CVAFTKBB:String, ?OGVNUJNX:String, ?KJZPNLSE:Int = 4):World
	{
		var WYIXVWJW = 0;
		while (WYIXVWJW < ZSNJDPIO * KJZPNLSE)
		{
			final EPIPYDPC = new SpriteBlock((WYIXVWJW < ZSNJDPIO) ? OGVNUJNX ?? CVAFTKBB : CVAFTKBB);
			if (EPIPYDPC.RZGZEZLM != null)
				XSNJGRXZ(EPIPYDPC, WYIXVWJW + (ZSNJDPIO * (WCLMIURN - KJZPNLSE)));
			WYIXVWJW++;
		}
		LEDNRLOO();
		return this;
	}

	public function GDAXVPPP(XOTTVUVU:Float, RMFZKGPM:String, WUSSJVRM:String, WYRKJIHN:Int = 4):World
	{
		var CXZOHYBU = 0;
		while (CXZOHYBU < ZSNJDPIO * WYRKJIHN)
		{
			final BHGJDJGP = new SpriteBlock((FlxG.random.bool(XOTTVUVU)) ? (WUSSJVRM ?? RMFZKGPM ?? null) : (RMFZKGPM ?? null));
			if (BHGJDJGP.RZGZEZLM != null)
				XSNJGRXZ(BHGJDJGP, CXZOHYBU + (ZSNJDPIO * (WCLMIURN - WYRKJIHN)));
			CXZOHYBU++;
		}
		LEDNRLOO();
		return this;
	}

	public function LEDNRLOO()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function YGBBNRFU():World
	{
		var DYWRIYRY:World = new World();
		for (RENLPTYM in this.members)
			DYWRIYRY.members.push(RENLPTYM);
		return DYWRIYRY;
	}
}
