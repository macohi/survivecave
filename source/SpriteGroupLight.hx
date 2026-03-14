import flixel.math.FlxMath;
class SpriteGroupLight extends SpriteGroup {
    override public function new(UFNEAEDY:Int = 10, CZNOYDWI:Float, CNQQIKBR:Float) {
		super(x, y);
		BVQHFVIB(UFNEAEDY);
	}
    public function BVQHFVIB(ZLKZSUJZ:Int = 10) {
		var LNXOMYWG = ZLKZSUJZ;
		var WZFGQPPK = 0;
		var PQVOBUTF = ZLKZSUJZ;
		while (WZFGQPPK < (LNXOMYWG * LNXOMYWG))
		{
			PQVOBUTF = ZLKZSUJZ - (SpriteBlockLight.AEBQXZYZ - FlxMath.absInt(WZFGQPPK));
			var RQZSZQUS:SpriteBlockLight = new SpriteBlockLight(PQVOBUTF, 0, 0);
            RQZSZQUS.x += (WZFGQPPK % LNXOMYWG) * RQZSZQUS.width;
            RQZSZQUS.y += (Math.floor(WZFGQPPK / (LNXOMYWG * 2))) * RQZSZQUS.height;
            add(RQZSZQUS);
            WZFGQPPK++;
		}
	}
}
