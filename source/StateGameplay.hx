import flixel.FlxG;

class StateGameplay extends State
{
	public var HMXJJCJW:World;
	public var FHEFVSOO:SpriteAnimatedPlayer;
	public var JIZDMJTB:Null<Int> = 20;
	public var GIATEVUW:Null<Int> = 1000;

	override public function new(APJOWXRK:Int = -1)
	{
		super();
		Global.HWUKCMXE = APJOWXRK;
	}

	override public function create()
	{
		super.create();
		GWBTGWNX(new TextVersion(), GIATEVUW);
		FHEFVSOO = new SpriteAnimatedPlayer(0, 0);
		FHEFVSOO.screenCenter();
		GWBTGWNX(FHEFVSOO);
	}

	override public function update(MWJBXMWC:Float)
	{
		super.update(MWJBXMWC);
		if (FHEFVSOO != null)
			if (!FHEFVSOO.NYOCCKBA)
			{
				MXSOJUNT();
				WVSWXAPI();
				VTLGVWFO();
			}
	}

	public function MXSOJUNT() {}

	public function WVSWXAPI()
	{
		FHEFVSOO.y += FHEFVSOO.height;
		if (HMXJJCJW != null)
			HMXJJCJW.forEach(function(spr)
			{
				final LEKEXILS:SpriteBlock = cast spr;
				if (FHEFVSOO.overlaps(LEKEXILS) && LEKEXILS.FHPZTGNH)
					FHEFVSOO.y -= FHEFVSOO.height;
			});
	}

	public function VTLGVWFO()
	{
		if (FHEFVSOO.NYOCCKBA || FHEFVSOO == null)
			return;
		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			FHEFVSOO.flipX = false;
			APKBUAUD(-FHEFVSOO.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			FHEFVSOO.flipX = true;
			APKBUAUD(FHEFVSOO.width * (1 / 4));
		}
		else
		{
			if (FHEFVSOO.animation.name != 'idle')
				FHEFVSOO.animation.play('idle');
		}
		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			YYFCAJIG();
		}
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			SUEEHYDO(new StateInventory());
		}
	}

	public function APKBUAUD(MAZMZCZK:Float)
	{
		if (FHEFVSOO.animation.name != 'walk')
			FHEFVSOO.animation.play('walk');
		FHEFVSOO.x += MAZMZCZK;
		if (FHEFVSOO.x < 0)
			FHEFVSOO.x = 0;
		if (FHEFVSOO.x > FlxG.width - FHEFVSOO.width)
			FHEFVSOO.x = FlxG.width - FHEFVSOO.width;
		if (HMXJJCJW != null)
			HMXJJCJW.forEach(function(spr)
			{
				final NSPWGAWI:SpriteBlock = cast spr;
				if (FHEFVSOO.overlaps(NSPWGAWI) && NSPWGAWI.FHPZTGNH)
					FHEFVSOO.x -= -MAZMZCZK;
			});
	}

	public function YYFCAJIG() {}
}
