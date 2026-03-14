import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(SHYLVOYY:String, ?IEJEQXGO:Float, ?JAMQCUKC:Float)
	{
		super(IEJEQXGO, JAMQCUKC, (SHYLVOYY == null) ? null : 'assets/$SHYLVOYY.png');
		FUNMYEDC(2);
	}

	public function ZYDXGHCJ(VERLADQE:Float, VNHNRXLA:Float)
	{
		this.scale.set(VERLADQE, VNHNRXLA);
		updateHitbox();
	}

	public function FUNMYEDC(KKMVOWJX:Float)
	{
		ZYDXGHCJ(KKMVOWJX, KKMVOWJX);
	}
}
