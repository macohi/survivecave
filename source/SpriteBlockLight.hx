class SpriteBlockLight extends SpriteBlock
{
	public var OYPPSDAH(default, set):Int = 10;

	public static var CFRUQPFJ:Int = 10;

	function set_OYPPSDAH(ZPSKEWOD:Int):Int
	{
		this.alpha = (ZPSKEWOD / CFRUQPFJ);
		return ZPSKEWOD;
	}

	override public function new(NAGAMFDW:Int = 10, ?XPGEEDBT:Float, ?SANMEFUG:Float)
	{
		super('light', XPGEEDBT, SANMEFUG);
		this.OYPPSDAH = ((NAGAMFDW > CFRUQPFJ) ? CFRUQPFJ : ((NAGAMFDW < 0) ? 0 : NAGAMFDW));
	}
}
