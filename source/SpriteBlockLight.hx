class SpriteBlockLight extends SpriteBlock
{
	public var STJCXLRN(default, set):Int = 10;

	public static var XXGEKEAT:Int = 10;

	function set_STJCXLRN(IPTEBDAY:Int):Int
	{
		this.alpha = (IPTEBDAY / XXGEKEAT);
		return IPTEBDAY;
	}

	override public function new(ILHFJOUD:Int = 10, ?YAXUVRIC:Float, ?NRNBWVYR:Float)
	{
		super('light', YAXUVRIC, NRNBWVYR);
		this.STJCXLRN = ((ILHFJOUD > XXGEKEAT) ? XXGEKEAT : ((ILHFJOUD < 0) ? 0 : ILHFJOUD));
	}
}
