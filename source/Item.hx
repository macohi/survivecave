class Item
{
	public var USCWGZYR:String = '';
	public var WQPOKVSP:String;
	public var LRMXYGLH:Null<Int>;

	public static var DOOANNNC:Int = 32;

	public function new(?RCICBLHN:String, ?QMLDQDNB:Null<Int>, ?USKCSITX:String)
	{
		this.WQPOKVSP = RCICBLHN ?? 'Unknown Item';
		this.LRMXYGLH = QMLDQDNB ?? 1;
		this.USCWGZYR = USKCSITX ?? this.WQPOKVSP.toLowerCase().trim().replace(' ', '-');
	}
}
