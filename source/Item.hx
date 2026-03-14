using StringTools;

class Item
{
	public var AMHZWCQH:String = '';
	public var BVIIHGEF:String;
	public var ZWGDJEVN:Null<Int>;

	public static var KHMIFXXW:Int = 32;

	public function new(?LDBZHVEG:String, ?PISIMXOL:Null<Int>, ?QRBEDDNC:String)
	{
		this.BVIIHGEF = LDBZHVEG ?? 'Unknown Item';
		this.ZWGDJEVN = PISIMXOL ?? 1;
		this.AMHZWCQH = QRBEDDNC ?? this.BVIIHGEF.toLowerCase().trim().replace(' ', '-');
	}
}
