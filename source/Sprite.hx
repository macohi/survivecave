import flixel.FlxState;
import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(graphic:String, ?x:Float, ?y:Float)
	{
		super(x, y, (graphic == null) ? null : 'assets/$graphic.png');

		setScaleSingle(2);
	}

	public function setScale(x:Float, y:Float)
	{
		this.scale.set(x, y);
		updateHitbox();
	}

	public function setScaleSingle(z:Float)
	{
		setScale(z, z);
	}
}
