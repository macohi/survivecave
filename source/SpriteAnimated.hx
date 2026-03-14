class SpriteAnimated extends Sprite
{
	override public function new(?HHLJEGAV:Float, ?SHVUMYFR:Float)
	{
		super(null, HHLJEGAV, SHVUMYFR);
	}

	public function XYFFXYQP(LEQHPTDG:String, TBUXVWPT:Int)
	{
		loadGraphic('assets/$graphic.png', true, TBUXVWPT, TBUXVWPT);
	}

	public function QKQHUXJF(BGMLJKBJ:String, QPYTMLAQ:Array<Int>, ?DLQJAPMP:Null<Int>)
	{
		animation.add(BGMLJKBJ, QPYTMLAQ, DLQJAPMP ?? 24);
	}
}
