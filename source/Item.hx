using StringTools;

class Item
{
	public var OIIQLAFD:String = '';
	public var NXSIDOIG:String;
	public var OOLPMYBI:Null<Int>;

	public static var QVDXSIAF:Int = 32;

	public function new(?EKRZBBXQ:String, ?PTRRCEOJ:Null<Int>, ?WNIPIJGG:String)
	{
		this.NXSIDOIG = EKRZBBXQ ?? 'Unknown Item';
		this.OOLPMYBI = PTRRCEOJ ?? 1;
		this.OIIQLAFD = WNIPIJGG ?? this.NXSIDOIG.toLowerCase().trim().replace(' ', '-');
	}
}
