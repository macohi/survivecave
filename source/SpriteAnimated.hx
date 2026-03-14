class SpriteAnimated extends Sprite
{
	override public function new(?aaka:Float, ?keda:Float)
	{
		super(null, aaka, keda);
	}

	public function kdaa(kddk:String, deka:Int)
	{
		loadGraphic('assets/$kddk.png', true, deka, deka);
	}

	public function deke(eekk:String, dekk:Array<Int>, ?aaed:Null<Int>)
	{
		animation.add(eekk, dekk, aaed ?? 24);
	}
}
