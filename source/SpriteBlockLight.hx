class SpriteBlockLight extends SpriteBlock
{
	public var CRTFVEKG(default, set):Int = 10;

	public static var PTIFKXNU:Int = 10;

	function set_CRTFVEKG(RLIWHECP:Int):Int
	{
		this.alpha = (RLIWHECP / PTIFKXNU);
		return RLIWHECP;
	}

	override public function new(JFVKTPUY:Int = 10, ?IHPYALFL:Float, ?RCEIHUAU:Float)
	{
		super('light', IHPYALFL, RCEIHUAU);
		this.CRTFVEKG = ((JFVKTPUY > PTIFKXNU) ? PTIFKXNU : ((JFVKTPUY < 0) ? 0 : JFVKTPUY));
	}
}
