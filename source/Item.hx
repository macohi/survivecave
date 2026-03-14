using StringTools;

class Item
{
	public var keee:String = '';
	public var akka:String;
	public var kkae:Null<Int>;

	public static var kked:Int = 32;

	public function new(?aede:String, ?eada:Null<Int>, ?aeka:String)
	{
		this.akka = aede ?? 'Unknown Item';
		this.kkae = eada ?? 1;
		this.keee = aeka ?? this.akka.toLowerCase().trim().replace(' ', '-');
	}
}
