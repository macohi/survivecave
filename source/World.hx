import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final OHBQOIJU:Int = 20;
	public static final LOSRANOH:Int = 15;

	override public function new()
	{
		super();
	}

	public function PGISORYH(BLFVBAPO:String, ?YEWJFWVU:String, ?MRRZSRHY:Int = 4):World
	{
		var VONLGHTS = 0;
		while (VONLGHTS < OHBQOIJU * MRRZSRHY)
		{
			final HFUJVOWW = new SpriteBlock((VONLGHTS < OHBQOIJU) ? YEWJFWVU ?? BLFVBAPO : BLFVBAPO);
			if (HFUJVOWW.NGQVONQE != null)
				OIRFXRRV(HFUJVOWW, VONLGHTS + (OHBQOIJU * (LOSRANOH - MRRZSRHY)));
			VONLGHTS++;
		}
		DTEQMJRS();
		return this;
	}

	public function PUKPBTRW(JRRATGPJ:Float, ZYOVJIGD:String, RJEJUFJD:String, SVCJDXAV:Int = 4):World
	{
		var DTZPTLTG = 0;
		while (DTZPTLTG < OHBQOIJU * SVCJDXAV)
		{
			final PTGBVSZF = new SpriteBlock((FlxG.random.bool(JRRATGPJ)) ? (RJEJUFJD ?? ZYOVJIGD ?? null) : (ZYOVJIGD ?? null));
			if (PTGBVSZF.NGQVONQE != null)
				OIRFXRRV(PTGBVSZF, DTZPTLTG + (OHBQOIJU * (LOSRANOH - SVCJDXAV)));
			DTZPTLTG++;
		}
		DTEQMJRS();
		return this;
	}

	public function DTEQMJRS()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function copy():World
	{
		var LWAENNGT:World = new World();
		for (ILRRNSFO in this.members)
			LWAENNGT.members.push(ILRRNSFO);
		return LWAENNGT;
	}
}
