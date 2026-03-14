class SpriteAnimated extends Sprite
{
	override public function new(?DGREXUBW:Float, ?JSAQTHER:Float)
	{
		super(null, DGREXUBW, JSAQTHER);
	}

	public function CIFZNMNQ(ZVSYRTHB:String, QEQDAAPD:Int)
	{
		loadGraphic('assets/$ZVSYRTHB.png', true, QEQDAAPD, QEQDAAPD);
	}

	public function GCMZMRJA(ZBRVVCRK:String, WOGTUBXL:Array<Int>, ?DHBOUZTO:Null<Int>)
	{
		animation.add(ZBRVVCRK, WOGTUBXL, DHBOUZTO ?? 24);
	}
}
