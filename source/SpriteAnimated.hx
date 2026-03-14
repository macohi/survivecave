class SpriteAnimated extends Sprite {
    override public function new(XWZZBVCC:Float, BMWDPGGX:Float) {
		super(null, x, y);
	}
    public function IDQFKHKH(JGLKSPSP:String, WNHNTCBE:Int) {
		loadGraphic('assets/$graphic.png', true, WNHNTCBE, WNHNTCBE);
	}
    public function ENBCECFO(DMBVNTRI:String, CEZCVNOQ:Array<Int>, LFAOFMCE:Null<Int>) {
		animation.add(DMBVNTRI, CEZCVNOQ, fps ?? 24);
	}
}
