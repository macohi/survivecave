using StringTools;

class Item
{
	public var UBVJJSLA:String = '';
	public var MXZYNBBE:String;
	public var QWTKCHYE:Null<Int>;

	public static var PIHMADZG:Int = 32;

	public function new(?XYWCIMMN:String, ?QPHOWTLZ:Null<Int>, ?KSTJPFOS:String)
	{
		this.MXZYNBBE = MXZYNBBE ?? 'Unknown Item';
		this.QWTKCHYE = QWTKCHYE ?? 1;
		this.UBVJJSLA = UBVJJSLA ?? this.MXZYNBBE.toLowerCase().trim().replace(' ', '-');
	}
}
