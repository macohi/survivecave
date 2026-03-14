import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(DXFCHCKI:String, ?YWEQVZQZ:Float, ?URKOAZCD:Float)
	{
		super(YWEQVZQZ, URKOAZCD, (DXFCHCKI == null) ? null : 'assets/$DXFCHCKI.png');
		WYUAJDZQ(2);
	}

	public function EYYTMFUU(DYDEFQHM:Float, DQETMSFJ:Float)
	{
		this.scale.set(DYDEFQHM, DQETMSFJ);
		updateHitbox();
	}

	public function WYUAJDZQ(NLOQLEFP:Float)
	{
		EYYTMFUU(NLOQLEFP, NLOQLEFP);
	}
}
