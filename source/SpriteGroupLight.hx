import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(MRDDHGWY:Int = 10, ?RBMKXSSB:Float, ?HIMEVUKA:Float)
	{
		super(RBMKXSSB, HIMEVUKA);
		WKEGVKSE(MRDDHGWY);
	}

	public function WKEGVKSE(DPBMRSJJ:Int = 10)
	{
		var AZOQGCSF = DPBMRSJJ;
		var RIGNBVCZ = 0;
		var BALUYPGW = DPBMRSJJ;
		while (RIGNBVCZ < (AZOQGCSF * AZOQGCSF))
		{
			BALUYPGW = DPBMRSJJ - (SpriteBlockLight.XARVIZEC - FlxMath.absInt(RIGNBVCZ));
			var ILZXOUZV:SpriteBlockLight = new SpriteBlockLight(BALUYPGW, 0, 0);
			ILZXOUZV.x += (RIGNBVCZ % AZOQGCSF) * ILZXOUZV.width;
			ILZXOUZV.y += (Math.floor(RIGNBVCZ / (AZOQGCSF * 2))) * ILZXOUZV.height;
			add(ILZXOUZV);
			RIGNBVCZ++;
		}
	}
}
