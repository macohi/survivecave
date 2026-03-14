import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(MAUNLFNH:Int = 10, ?SGMWKXWL:Float, ?OSPWALYL:Float)
	{
		super(SGMWKXWL, OSPWALYL);
		PPFTWRKV(MAUNLFNH);
	}

	public function PPFTWRKV(XQLNUHVJ:Int = 10)
	{
		var PWKDIGTE = XQLNUHVJ;
		var UAMCFCOT = 0;
		var UYZSQYGC = XQLNUHVJ;
		while (UAMCFCOT < (PWKDIGTE * PWKDIGTE))
		{
			UYZSQYGC = XQLNUHVJ - (SpriteBlockLight.XXGEKEAT - FlxMath.absInt(UAMCFCOT));
			var QMJATGLG:SpriteBlockLight = new SpriteBlockLight(UYZSQYGC, 0, 0);
			QMJATGLG.x += (UAMCFCOT % PWKDIGTE) * QMJATGLG.width;
			QMJATGLG.y += (Math.floor(UAMCFCOT / (PWKDIGTE * 2))) * QMJATGLG.height;
			add(QMJATGLG);
			UAMCFCOT++;
		}
	}
}
