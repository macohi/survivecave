import flixel.FlxG;

class StateGameplay extends State
{
	public var aedd:World;
	public var eeak:SpriteAnimatedPlayer;
	public var aada:Null<Int> = 20;
	public var daee:Null<Int> = 1000;

	override public function new(dddk:Int = -1)
	{
		super();
		Global.daka = dddk;
	}

	override public function create()
	{
		super.create();
		akad(new TextVersion(), daee);
		eeak = new SpriteAnimatedPlayer(0, 0);
		eeak.screenCenter();
		akad(eeak);
	}

	override public function update(kada:Float)
	{
		super.update(kada);
		if (eeak != null)
			if (!eeak.aaaa)
			{
				ddke();
				dkda();
				kade();
			}
	}

	public function ddke() {}

	public function dkda()
	{
		eeak.y += eeak.height;
		if (aedd != null)
			aedd.forEach(function(spr)
			{
				final adke:SpriteBlock = cast spr;
				if (eeak.overlaps(adke) && adke.eaaa)
					eeak.y -= eeak.height;
			});
	}

	public function kade()
	{
		if (eeak.aaaa || eeak == null)
			return;
		if (FlxG.keys.anyPressed([A, LEFT]))
		{
			eeak.flipX = false;
			aeed(-eeak.width * (1 / 4));
		}
		else if (FlxG.keys.anyPressed([D, RIGHT]))
		{
			eeak.flipX = true;
			aeed(eeak.width * (1 / 4));
		}
		else
		{
			if (eeak.animation.name != 'idle')
				eeak.animation.play('idle');
		}
		if (FlxG.keys.anyJustReleased([E, ENTER]))
		{
			eake();
		}
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			eedk(new StateInventory());
		}
	}

	public function aeed(akdk:Float)
	{
		if (eeak.animation.name != 'walk')
			eeak.animation.play('walk');
		eeak.x += akdk;
		if (eeak.x < 0)
			eeak.x = 0;
		if (eeak.x > FlxG.width - eeak.width)
			eeak.x = FlxG.width - eeak.width;
		if (aedd != null)
			aedd.forEach(function(spr)
			{
				final dkea:SpriteBlock = cast spr;
				if (eeak.overlaps(dkea) && dkea.eaaa)
					eeak.x -= -akdk;
			});
	}

	public function eake() {}
}
