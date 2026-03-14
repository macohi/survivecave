import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(eeee:String, ?daea:Float, ?eadk:Float)
	{
		super(daea, eadk, (eeee == null) ? null : 'assets/$eeee.png');
		kedk(2);
	}

	public function aake(kkke:Float, dadd:Float)
	{
		this.scale.set(kkke, dadd);
		updateHitbox();
	}

	public function kedk(dded:Float)
	{
		aake(dded, dded);
	}
}
