class SpriteBlockLight extends SpriteBlock
{
	public var SUNBVOFH(default, set):Int = 10;

	public static var XARVIZEC:Int = 10;

	function set_SUNBVOFH(MCZEMOVT:Int):Int
	{
		this.alpha = (MCZEMOVT / XARVIZEC);
		return MCZEMOVT;
	}

	override public function new(POSIMTVS:Int = 10, ?PVBNTQKF:Float, ?QXQIBBEW:Float)
	{
		super('light', PVBNTQKF, QXQIBBEW);
		this.SUNBVOFH = ((POSIMTVS > XARVIZEC) ? XARVIZEC : ((POSIMTVS < 0) ? 0 : POSIMTVS));
	}
}
