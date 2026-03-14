class SpriteBlockLight extends SpriteBlock
{
	public var RFSWVOYF(default, set):Int = 10;

	public static var AKDWLHBQ:Int = 10;

	function set_RFSWVOYF(QVSJNTLW:Int):Int
	{
		this.alpha = (QVSJNTLW / AKDWLHBQ);
		return QVSJNTLW;
	}

	override public function new(ODNCGPFM:Int = 10, ?DVLHHVYG:Float, ?WIMETSIG:Float)
	{
		super('light', DVLHHVYG, WIMETSIG);
		this.RFSWVOYF = ((ODNCGPFM > AKDWLHBQ) ? AKDWLHBQ : ((ODNCGPFM < 0) ? 0 : ODNCGPFM));
	}
}
