import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(TDPJXYXB:String, ?APQKWJYI:Float, ?ZLTMYIXU:Float)
	{
		super(APQKWJYI, ZLTMYIXU, (TDPJXYXB == null) ? null : 'assets/$graphic.png');
		DPHBHXUU(2);
	}

	public function YWACXZLJ(TZOCZITA:Float, JHXZPZTZ:Float)
	{
		this.scale.set(TZOCZITA, JHXZPZTZ);
		updateHitbox();
	}

	public function DPHBHXUU(CODDXOYP:Float)
	{
		YWACXZLJ(CODDXOYP, CODDXOYP);
	}
}
