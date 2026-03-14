import flixel.FlxG;

class StateGameplay extends State
{
	public var YDDKJIYG:World;
	public var USYGZTVH:SpriteAnimatedPlayer;
	public var LFEVQFUO:Null<Int> = 20;
	public var IRMCUKWM:Null<Int> = 1000;

	override public function new(TGMQQLJF:Int = -1)
	{
		super();
		Global.UPGGIWZK = TGMQQLJF;
	}

	override public function create()
	{
		super.create();
		UNSIKWET(new TextVersion(), IRMCUKWM);
		USYGZTVH = new SpriteAnimatedPlayer(0, 0);
		USYGZTVH.screenCenter();
		UNSIKWET(USYGZTVH);
	}

	override public function update(KRZKRAAS:Float)
	{
		super.update(KRZKRAAS);
		if (USYGZTVH != null)
			if (!USYGZTVH.EXOOWGAI)
			{
				FJXHZLKK();
				ZDYWVDPK();
				FUOQBETH();
			}
	}

	public function FJXHZLKK() {}

	public function ZDYWVDPK()
	{
		USYGZTVH.y += USYGZTVH.height;
		if (YDDKJIYG != null)
			YDDKJIYG.forEach(function(spr)
			{
				final GANXEOHO:SpriteBlock = cast spr;
				if (USYGZTVH.overlaps(GANXEOHO) && GANXEOHO.NODWSLDD)
					USYGZTVH.y -= USYGZTVH.height;
			});
	}

	public function FUOQBETH()
	{
		if (USYGZTVH.EXOOWGAI || USYGZTVH == null)
			return;
		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			USYGZTVH.flipX = false;
			IMTXZLFJ(-USYGZTVH.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			USYGZTVH.flipX = true;
			IMTXZLFJ(USYGZTVH.width * (1 / 4));
		}
		else
		{
			if (USYGZTVH.animation.name != 'idle')
				USYGZTVH.animation.play('idle');
		}
		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			ZHOQDXJZ();
		}
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			QGSLUMWT(new StateInventory());
		}
	}

	public function IMTXZLFJ(WQRAHADX:Float)
	{
		if (USYGZTVH.animation.name != 'walk')
			USYGZTVH.animation.play('walk');
		USYGZTVH.x += WQRAHADX;
		if (USYGZTVH.x < 0)
			USYGZTVH.x = 0;
		if (USYGZTVH.x > FlxG.width - USYGZTVH.width)
			USYGZTVH.x = FlxG.width - USYGZTVH.width;
		if (YDDKJIYG != null)
			YDDKJIYG.forEach(function(spr)
			{
				final KZOZCEEF:SpriteBlock = cast spr;
				if (USYGZTVH.overlaps(KZOZCEEF) && KZOZCEEF.NODWSLDD)
					USYGZTVH.x -= -WQRAHADX;
			});
	}

	public function ZHOQDXJZ() {}
}
