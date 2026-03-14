import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(FNLLWUIN:String, ?QKTIPGFY:Float, ?PJXIELYL:Float)
	{
		super(QKTIPGFY, PJXIELYL, (FNLLWUIN == null) ? null : 'assets/$graphic.png');
		FJEZGEEX(2);
	}

	public function QHFUIBVB(EAOIPDEA:Float, HFBKVMLR:Float)
	{
		this.scale.set(EAOIPDEA, HFBKVMLR);
		updateHitbox();
	}

	public function FJEZGEEX(UPMFEEWE:Float)
	{
		QHFUIBVB(UPMFEEWE, UPMFEEWE);
	}
}
