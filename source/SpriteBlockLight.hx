class SpriteBlockLight extends SpriteBlock
{
	public var NFGLMNGX(default, set):Int = 10;

	public static var UAOOHLUY:Int = 10;

	function set_NFGLMNGX(BJRPZKLY:Int):Int
	{
		this.alpha = (BJRPZKLY / UAOOHLUY);
		return BJRPZKLY;
	}

	override public function new(ZMKBTUBW:Int = 10, ?DIONWGDF:Float, ?KIETPWYP:Float)
	{
		super('light', DIONWGDF, KIETPWYP);
		this.NFGLMNGX = ((NFGLMNGX > UAOOHLUY) ? UAOOHLUY : ((NFGLMNGX < 0) ? 0 : NFGLMNGX));
	}
}
