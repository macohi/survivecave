class SpriteAnimated extends Sprite
{
	override public function new(?NJNLBTKS:Float, ?SVDWFXWU:Float)
	{
		super(null, NJNLBTKS, SVDWFXWU);
	}

	public function ZZOIERQL(YRTZDMGQ:String, HMXKVXVT:Int)
	{
		loadGraphic('assets/$YRTZDMGQ.png', true, HMXKVXVT, HMXKVXVT);
	}

	public function FWTUYSYE(FVSGGVVC:String, GKEABCVD:Array<Int>, ?WLLKZCJA:Null<Int>)
	{
		animation.add(FVSGGVVC, GKEABCVD, WLLKZCJA ?? 24);
	}
}
