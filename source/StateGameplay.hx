import flixel.FlxG;

class StateGameplay extends State
{
	public var ICBWJFOZ:World;
	public var YCLUEHCU:SpriteAnimatedPlayer;
	public var CJGMCCZE:Null<Int> = 20;
	public var CBKFCWZT:Null<Int> = 1000;

	override public function new(ZKIVBTTC:Int = -1)
	{
		super();
		Global.AXUHRJTP = ZKIVBTTC;
	}

	override public function create()
	{
		super.create();
		SMIXXKUZ(new TextVersion(), CBKFCWZT);
		YCLUEHCU = new SpriteAnimatedPlayer(0, 0);
		YCLUEHCU.screenCenter();
		SMIXXKUZ(YCLUEHCU);
	}

	override public function update(IDADRPAA:Float)
	{
		super.update(IDADRPAA);
		if (YCLUEHCU != null)
			if (!YCLUEHCU.QVTKGTCV)
			{
				DDKDRETF();
				SPCNUHIZ();
				GEDAGYUB();
			}
	}

	public function DDKDRETF() {}

	public function SPCNUHIZ()
	{
		YCLUEHCU.y += YCLUEHCU.height;
		if (ICBWJFOZ != null)
			ICBWJFOZ.forEach(function(spr)
			{
				final YFOPHPKR:SpriteBlock = cast spr;
				if (YCLUEHCU.overlaps(YFOPHPKR) && YFOPHPKR.XVGTMSQQ)
					YCLUEHCU.y -= YCLUEHCU.height;
			});
	}

	public function GEDAGYUB()
	{
		if (YCLUEHCU.QVTKGTCV || YCLUEHCU == null)
			return;
		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			YCLUEHCU.flipX = false;
			ESJTOJKV(-YCLUEHCU.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			YCLUEHCU.flipX = true;
			ESJTOJKV(YCLUEHCU.width * (1 / 4));
		}
		else
		{
			if (YCLUEHCU.animation.name != 'idle')
				YCLUEHCU.animation.play('idle');
		}
		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			MXCPDVBA();
		}
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			LEFMGEJF(new StateInventory());
		}
	}

	public function ESJTOJKV(YVWGANDY:Float)
	{
		if (YCLUEHCU.animation.name != 'walk')
			YCLUEHCU.animation.play('walk');
		YCLUEHCU.x += YVWGANDY;
		if (YCLUEHCU.x < 0)
			YCLUEHCU.x = 0;
		if (YCLUEHCU.x > FlxG.width - YCLUEHCU.width)
			YCLUEHCU.x = FlxG.width - YCLUEHCU.width;
		if (ICBWJFOZ != null)
			ICBWJFOZ.forEach(function(spr)
			{
				final SYCIZDHP:SpriteBlock = cast spr;
				if (YCLUEHCU.overlaps(SYCIZDHP) && SYCIZDHP.XVGTMSQQ)
					YCLUEHCU.x -= -YVWGANDY;
			});
	}

	public function MXCPDVBA() {}
}
