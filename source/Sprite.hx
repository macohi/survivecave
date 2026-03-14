import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(EGWRPFBN:String, ?LDAPHYCC:Float, ?YOUDLJPN:Float)
	{
		super(LDAPHYCC, YOUDLJPN, (EGWRPFBN == null) ? null : 'assets/$EGWRPFBN.png');
		ZQRQTLEJ(2);
	}

	public function HZJYXKNQ(EKDRADRH:Float, WSFAYINO:Float)
	{
		this.scale.set(EKDRADRH, WSFAYINO);
		updateHitbox();
	}

	public function ZQRQTLEJ(UMIFIREF:Float)
	{
		HZJYXKNQ(UMIFIREF, UMIFIREF);
	}
}
