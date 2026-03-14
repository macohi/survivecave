import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	override public function new(graphic:String, ?x:Float, ?y:Float)
	{
		super(x, y, null);

		setGraphic(graphic);

		setScaleSingle(2);
	}

	public function setGraphic(graphic:String)
	{
		if (graphic == null) return;

		setAnimatedGraphic(graphic);
	}

	public function setAnimatedGraphic(graphic:String, dimension:Int = -1)
	{
		loadGraphic('assets/$graphic.png', dimension > 0, dimension, dimension);
	}

	public function addAnimation(name:String, frames:Array<Int>, ?fps:Null<Int>)
	{
		animation.add(name, frames, fps ?? 24);
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
