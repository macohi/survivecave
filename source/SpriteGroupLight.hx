import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(RUPZBFON:Int = 10, ?PERKTQLW:Float, ?SQVAIEZS:Float)
	{
		super(PERKTQLW, SQVAIEZS);
		FDKKGYQH(RUPZBFON);
	}

	public function FDKKGYQH(KHRCUZDJ:Int = 10)
	{
		var WXLLYMMV = KHRCUZDJ;
		var EDDSJJRQ = 0;
		var EBBPIVEX = KHRCUZDJ;
		while (EDDSJJRQ < (WXLLYMMV * WXLLYMMV))
		{
			EBBPIVEX = KHRCUZDJ - (SpriteBlockLight.UAOOHLUY - FlxMath.absInt(EDDSJJRQ));
			var KSVRYQXB:SpriteBlockLight = new SpriteBlockLight(EBBPIVEX, 0, 0);
			KSVRYQXB.x += (EDDSJJRQ % WXLLYMMV) * KSVRYQXB.width;
			KSVRYQXB.y += (Math.floor(EDDSJJRQ / (WXLLYMMV * 2))) * KSVRYQXB.height;
			add(KSVRYQXB);
			EDDSJJRQ++;
		}
	}
}
