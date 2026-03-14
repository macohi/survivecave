class SpriteAnimated extends Sprite
{
	override public function new(?JMVFEJUH:Float, ?AMLFPHJS:Float)
	{
		super(null, JMVFEJUH, AMLFPHJS);
	}

	public function ROXCKAWC(PIQQABWF:String, JNOXBJAZ:Int)
	{
		loadGraphic('assets/$graphic.png', true, JNOXBJAZ, JNOXBJAZ);
	}

	public function QAYODEGE(PCVTRWHY:String, RUOJDDDA:Array<Int>, ?VAOGYNNB:Null<Int>)
	{
		animation.add(PCVTRWHY, RUOJDDDA, VAOGYNNB ?? 24);
	}
}
