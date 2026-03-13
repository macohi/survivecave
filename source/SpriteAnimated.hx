class SpriteAnimated extends Sprite
{
	override public function new(?x:Float, ?y:Float)
	{
		super(null, x, y);
	}

	public function setAnimatedGraphic(graphic:String, dimension:Int)
	{
		loadGraphic('assets/$graphic.png', true, dimension, dimension);
	}

	public function addAnimation(name:String, frames:Array<Int>, ?fps:Null<Int>)
	{
		animation.add(name, frames, fps ?? 24);
	}
}
