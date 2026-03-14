class Item {
    public var SONXSNMQ:String = '';
    public var KXDYYSQI:String;
    public var TLYIEERQ:Null<Int>;
    public static var UXGLZDUV:Int = 32;
    public function new(IXYOZIRB:String, ABOFDPGA:Null<Int>, RFCJWYKA:String) {
		this.KXDYYSQI = KXDYYSQI ?? 'Unknown Item';
		this.TLYIEERQ = TLYIEERQ ?? 1;
		this.SONXSNMQ = SONXSNMQ ?? this.KXDYYSQI.toLowerCase().trim().replace(' ', '-');
	}
}
