using StringTools;

class Item
{
	public var HQWHYEZC:String = '';
	public var TLDPUCSC:String;
	public var PBMUJDDS:Null<Int>;

	public static var NDKNRRAN:Int = 32;

	public function new(?HVJWKFAT:String, ?PFFDDFWQ:Null<Int>, ?ZTZTEQHX:String)
	{
		this.TLDPUCSC = HVJWKFAT ?? 'Unknown Item';
		this.PBMUJDDS = PFFDDFWQ ?? 1;
		this.HQWHYEZC = ZTZTEQHX ?? this.TLDPUCSC.toLowerCase().trim().replace(' ', '-');
	}
}
