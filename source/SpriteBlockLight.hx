class SpriteBlockLight extends SpriteBlock {
    public var IZATZMKZ(default, set):Int = 10;
    public static var AEBQXZYZ:Int = 10;
    function set_IZATZMKZ(RKPRHNBL:Int):Int {
		this.alpha = (RKPRHNBL / AEBQXZYZ);
		return RKPRHNBL;
	}
    override public function new(EWIRITDV:Int = 10, FCMJGXRL:Float, AWGJLMKX:Float) {
		super('light', x, y);
		this.IZATZMKZ = ((EWIRITDV > AEBQXZYZ) ? AEBQXZYZ : ((EWIRITDV < 0) ? 0 : EWIRITDV));
	}
}
