import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(FIODXARS:Int = 10, ?NYOGCTJU:Float, ?IBSZNYHH:Float)
	{
		super(NYOGCTJU, IBSZNYHH);
		GWWIQLQE(FIODXARS);
	}

	public function GWWIQLQE(XSXBLIZD:Int = 10)
	{
		var UXPYZOKL = XSXBLIZD;
		var WKGFGEQO = 0;
		var MFUNABLT = XSXBLIZD;
		while (WKGFGEQO < (UXPYZOKL * UXPYZOKL))
		{
			MFUNABLT = XSXBLIZD - (SpriteBlockLight.CFRUQPFJ - FlxMath.absInt(WKGFGEQO));
			var PASTYQYV:SpriteBlockLight = new SpriteBlockLight(MFUNABLT, 0, 0);
			PASTYQYV.x += (WKGFGEQO % UXPYZOKL) * PASTYQYV.width;
			PASTYQYV.y += (Math.floor(WKGFGEQO / (UXPYZOKL * 2))) * PASTYQYV.height;
			add(PASTYQYV);
			WKGFGEQO++;
		}
	}
}
