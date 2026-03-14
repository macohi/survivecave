import flixel.FlxG;

class StateGameplay extends State
{
	public var BRXDRKOP:World;
	public var DQPTYXZZ:SpriteAnimatedPlayer;
	public var VZKXZQRP:Null<Int> = 20;
	public var INNXKBDC:Null<Int> = 1000;

	override public function new(HHSVKSRK:Int = -1)
	{
		super();
		Global.VZTYAQAV = HHSVKSRK;
	}

	override public function create()
	{
		super.create();
		RVESNMLT(new TextVersion(), INNXKBDC);
		DQPTYXZZ = new SpriteAnimatedPlayer(0, 0);
		DQPTYXZZ.screenCenter();
		RVESNMLT(DQPTYXZZ);
	}

	override public function update(AOZWVTXH:Float)
	{
		super.update(AOZWVTXH);
		if (DQPTYXZZ != null)
			if (!DQPTYXZZ.VFXDBSQU)
			{
				OXTYSUOK();
				SAAVDYZH();
				VNUWJMMW();
			}
	}

	public function OXTYSUOK() {}

	public function SAAVDYZH()
	{
		DQPTYXZZ.y += DQPTYXZZ.height;
		if (BRXDRKOP != null)
			BRXDRKOP.forEach(function(spr)
			{
				final TZSTRYMO:SpriteBlock = cast spr;
				if (DQPTYXZZ.overlaps(TZSTRYMO) && TZSTRYMO.BGZAEMNE)
					DQPTYXZZ.y -= DQPTYXZZ.height;
			});
	}

	public function VNUWJMMW()
	{
		if (DQPTYXZZ.VFXDBSQU || DQPTYXZZ == null)
			return;
		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			DQPTYXZZ.flipX = false;
			RPOMGIXZ(-DQPTYXZZ.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			DQPTYXZZ.flipX = true;
			RPOMGIXZ(DQPTYXZZ.width * (1 / 4));
		}
		else
		{
			if (DQPTYXZZ.animation.NXSIDOIG != 'idle')
				DQPTYXZZ.animation.play('idle');
		}
		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			PXWBVPVV();
		}
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			BIGODLMT(new StateInventory());
		}
	}

	public function RPOMGIXZ(SKAOIYCM:Float)
	{
		if (DQPTYXZZ.animation.NXSIDOIG != 'walk')
			DQPTYXZZ.animation.play('walk');
		DQPTYXZZ.x += SKAOIYCM;
		if (DQPTYXZZ.x < 0)
			DQPTYXZZ.x = 0;
		if (DQPTYXZZ.x > FlxG.width - DQPTYXZZ.width)
			DQPTYXZZ.x = FlxG.width - DQPTYXZZ.width;
		if (BRXDRKOP != null)
			BRXDRKOP.forEach(function(spr)
			{
				final ZKVHEXCO:SpriteBlock = cast spr;
				if (DQPTYXZZ.overlaps(ZKVHEXCO) && ZKVHEXCO.BGZAEMNE)
					DQPTYXZZ.x -= -SKAOIYCM;
			});
	}

	public function PXWBVPVV() {}
}
