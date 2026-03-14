using StringTools;

class Item
{
	public var RRAJBBNZ:String = '';
	public var KPHIBLKB:String;
	public var AHPGHSIC:Null<Int>;

	public static var JZFOGVEW:Int = 32;

	public function new(?PUZBFYRA:String, ?UWYHWAOO:Null<Int>, ?JWGYHOSA:String)
	{
		this.KPHIBLKB = PUZBFYRA ?? 'Unknown Item';
		this.AHPGHSIC = UWYHWAOO ?? 1;
		this.RRAJBBNZ = JWGYHOSA ?? this.KPHIBLKB.toLowerCase().trim().replace(' ', '-');
	}
}
