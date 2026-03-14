class SpriteAnimated extends Sprite
{
	override public function new(?NNFXNOQL:Float, ?IDUYNMGD:Float)
	{
		super(null, NNFXNOQL, IDUYNMGD);
	}

	public function IDPVPBYU(LSHSBVVY:String, DNBTIIVV:Int)
	{
		loadGraphic('assets/$LSHSBVVY.png', true, DNBTIIVV, DNBTIIVV);
	}

	public function DMHKVXGD(GNWWWIJL:String, TCSBVHPZ:Array<Int>, ?IZDEXBGD:Null<Int>)
	{
		animation.add(GNWWWIJL, TCSBVHPZ, IZDEXBGD ?? 24);
	}
}
