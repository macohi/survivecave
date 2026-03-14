import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(NZTAGQKC:String, ?AZZPWVKH:Float, ?JJIWAMKX:Float)
	{
		super(AZZPWVKH, JJIWAMKX, (NZTAGQKC == null) ? null : 'assets/$NZTAGQKC.png');
		CMPECSPZ(2);
	}

	public function NUFWFWLA(YXKXHVJR:Float, BMZLNULE:Float)
	{
		this.scale.set(YXKXHVJR, BMZLNULE);
		updateHitbox();
	}

	public function CMPECSPZ(HAWHKKPF:Float)
	{
		NUFWFWLA(HAWHKKPF, HAWHKKPF);
	}
}
