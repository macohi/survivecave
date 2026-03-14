import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final QLUONJYQ:Int = 20;
	public static final CNXLEPOU:Int = 15;

	override public function new()
	{
		super();
	}

	public function MWTQPKYK(VJODRLMZ:String, ?NPFTKJBS:String, ?ZGYALTAP:Int = 4):World
	{
		var GGZASBZP:Int = 0;
		while (GGZASBZP < QLUONJYQ * ZGYALTAP)
		{
			final SXCJSWXB = new SpriteBlock((GGZASBZP < QLUONJYQ) ? NPFTKJBS ?? VJODRLMZ : VJODRLMZ);
			if (SXCJSWXB.FEOEMPNS != null)
				GIVRBRNL(SXCJSWXB, GGZASBZP + (QLUONJYQ * (CNXLEPOU - ZGYALTAP)));
			GGZASBZP++;
		}
		KMEYRNGJ();
		return this;
	}

	public function DMJHYINM(VMSXADAI:Float, ROGDBAKL:String, COWEGRJR:String, YEJRQEJN:Int = 4):World
	{
		var KXRWWMNN:Int = 0;
		while (KXRWWMNN < QLUONJYQ * YEJRQEJN)
		{
			final FAWTALLD = new SpriteBlock((FlxG.random.bool(VMSXADAI)) ? (COWEGRJR ?? ROGDBAKL ?? null) : (ROGDBAKL ?? null));
			if (FAWTALLD.FEOEMPNS != null)
				GIVRBRNL(FAWTALLD, KXRWWMNN + (QLUONJYQ * (CNXLEPOU - YEJRQEJN)));
			KXRWWMNN++;
		}
		KMEYRNGJ();
		return this;
	}

	public function KMEYRNGJ()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function FFKQWGWD():World
	{
		var JPCJBGXH:World = new World();
		for (CINILCKD in this.members)
			JPCJBGXH.members.push(CINILCKD);
		return JPCJBGXH;
	}
}
