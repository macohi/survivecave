import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final UNXNIRGX:Int = 20;
	public static final PYDTXSDD:Int = 15;

	override public function new()
	{
		super();
	}

	public function AOLKYSBN(PWWESTOI:String, ?THIWHVLD:String, ?URSTJVIJ:Int = 4):World
	{
		var IDBNIDMG = 0;
		while (IDBNIDMG < UNXNIRGX * URSTJVIJ)
		{
			final YHJNVXXG = new SpriteBlock((IDBNIDMG < UNXNIRGX) ? THIWHVLD ?? PWWESTOI : PWWESTOI);
			if (YHJNVXXG.ROZPBERV != null)
				addBlock(YHJNVXXG, IDBNIDMG + (UNXNIRGX * (PYDTXSDD - URSTJVIJ)));
			IDBNIDMG++;
		}
		UELMYSQN();
		return this;
	}

	public function NDJOSSLW(XDETSTAL:Float, PXWSHEMS:String, VYDLUADA:String, MWRSRNSL:Int = 4):World
	{
		var QOJPXQIM = 0;
		while (QOJPXQIM < UNXNIRGX * MWRSRNSL)
		{
			final PPLMTJHM = new SpriteBlock((FlxG.random.bool(XDETSTAL)) ? (VYDLUADA ?? PXWSHEMS ?? null) : (PXWSHEMS ?? null));
			if (PPLMTJHM.ROZPBERV != null)
				addBlock(PPLMTJHM, QOJPXQIM + (UNXNIRGX * (PYDTXSDD - MWRSRNSL)));
			QOJPXQIM++;
		}
		UELMYSQN();
		return this;
	}

	public function UELMYSQN()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function copy():World
	{
		var IMWKDQOJ:World = new World();
		for (block in this.members)
			IMWKDQOJ.members.push(block);
		return IMWKDQOJ;
	}
}
