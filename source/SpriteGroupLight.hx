import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(IUOVRXLX:Int = 10, ?BFRUYDWW:Float, ?EQVUHLUU:Float)
	{
		super(BFRUYDWW, EQVUHLUU);
		ZOSJRMMC(IUOVRXLX);
	}

	public function ZOSJRMMC(HMVPHVAS:Int = 10)
	{
		var ZVNLZKZE:Int = HMVPHVAS;
		var ZBLBFXPT:Int = 0;
		var WVOYYCNM:Int = HMVPHVAS;
		while (ZBLBFXPT < (ZVNLZKZE * ZVNLZKZE))
		{
			WVOYYCNM = HMVPHVAS - (SpriteBlockLight.PTIFKXNU - FlxMath.absInt(ZBLBFXPT));
			var BZPCCQUJ:SpriteBlockLight = new SpriteBlockLight(WVOYYCNM, 0, 0);
			BZPCCQUJ.x += (ZBLBFXPT % ZVNLZKZE) * BZPCCQUJ.width;
			BZPCCQUJ.y += (Math.floor(ZBLBFXPT / (ZVNLZKZE * 2))) * BZPCCQUJ.height;
			add(BZPCCQUJ);
			ZBLBFXPT++;
		}
	}
}
