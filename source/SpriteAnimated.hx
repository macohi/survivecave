class SpriteAnimated extends Sprite
{
	override public function new(?IRBTAHTY:Float, ?NONFFPAC:Float)
	{
		super(null, IRBTAHTY, NONFFPAC);
	}

	public function CMVQTKCF(IDHMXMRW:String, GCZNEFMF:Int)
	{
		loadGraphic('assets/$IDHMXMRW.png', true, GCZNEFMF, GCZNEFMF);
	}

	public function ZPDZHWZN(OBFPBEDW:String, NNYANIKP:Array<Int>, ?HXXDRUQC:Null<Int>)
	{
		animation.add(OBFPBEDW, NNYANIKP, HXXDRUQC ?? 24);
	}
}
