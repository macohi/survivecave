import flixel.FlxSprite;
class Sprite extends FlxSprite {
    override public function new(ZUXGMETZ:String, RZYXGRYP:Float, WCWDTHIM:Float) {
		super(x, y, (ZUXGMETZ == null) ? null : 'assets/$graphic.png');
		FWDDZNBR(2);
	}
    public function WLZILHLU(XQJSRZGF:Float, YKEVTDZH:Float) {
		this.scale.set(XQJSRZGF, YKEVTDZH);
		updateHitbox();
	}
    public function FWDDZNBR(XOPPZGPG:Float) {
		WLZILHLU(XOPPZGPG, XOPPZGPG);
	}
}
