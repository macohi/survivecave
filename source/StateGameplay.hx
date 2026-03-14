import flixel.FlxG;

class StateGameplay extends State
{
	public var GZJSCUTV:World;
	public var KXEJEAAN:SpriteAnimatedPlayer;
	public var VRXWLHWO:Null<Int> = 20;
	public var LPPBYHUT:Null<Int> = 1000;

	override public function new(ACVXIDCK:Int = -1)
	{
		super();
		Global.XDUXVHZI = ACVXIDCK;
	}

	override public function create()
	{
		super.create();
		LLZVDFNS(new TextVersion(), LPPBYHUT);
		KXEJEAAN = new SpriteAnimatedPlayer(0, 0);
		KXEJEAAN.screenCenter();
		LLZVDFNS(KXEJEAAN);
	}

	override public function update(SEUTGUOL:Float)
	{
		super.update(SEUTGUOL);
		if (KXEJEAAN != null)
			if (!KXEJEAAN.CIQKBQYK)
			{
				KDMRYGBM();
				SMMANXKN();
				ZDDMKLEY();
			}
	}

	public function KDMRYGBM() {}

	public function SMMANXKN()
	{
		KXEJEAAN.y += KXEJEAAN.height;
		if (GZJSCUTV != null)
			GZJSCUTV.forEach(function(spr)
			{
				final LHGHFWHF:SpriteBlock = cast spr;
				if (KXEJEAAN.overlaps(LHGHFWHF) && LHGHFWHF.QFCDJPTG)
					KXEJEAAN.y -= KXEJEAAN.height;
			});
	}

	public function ZDDMKLEY()
	{
		if (KXEJEAAN.CIQKBQYK || KXEJEAAN == null)
			return;
		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			KXEJEAAN.flipX = false;
			WMMHIDEJ(-KXEJEAAN.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			KXEJEAAN.flipX = true;
			WMMHIDEJ(KXEJEAAN.width * (1 / 4));
		}
		else
		{
			if (KXEJEAAN.animation.name != 'idle')
				KXEJEAAN.animation.play('idle');
		}
		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			UGOBXNZX();
		}
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			DLPDTVYD(new StateInventory());
		}
	}

	public function WMMHIDEJ(DMXWDTXT:Float)
	{
		if (KXEJEAAN.animation.name != 'walk')
			KXEJEAAN.animation.play('walk');
		KXEJEAAN.x += DMXWDTXT;
		if (KXEJEAAN.x < 0)
			KXEJEAAN.x = 0;
		if (KXEJEAAN.x > FlxG.width - KXEJEAAN.width)
			KXEJEAAN.x = FlxG.width - KXEJEAAN.width;
		if (GZJSCUTV != null)
			GZJSCUTV.forEach(function(spr)
			{
				final AYJUMQFY:SpriteBlock = cast spr;
				if (KXEJEAAN.overlaps(AYJUMQFY) && AYJUMQFY.QFCDJPTG)
					KXEJEAAN.x -= -DMXWDTXT;
			});
	}

	public function UGOBXNZX() {}
}
