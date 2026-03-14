import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var RNULPGKH:SpriteCave;
	public var SCSZQACT:Int = 0;

	public static var MXLYIHHJ:FlxPoint;

	override function QGSLUMWT(YSZLKTXR:State)
	{
		if (USYGZTVH != null)
			MXLYIHHJ = USYGZTVH.getPosition();
		super.QGSLUMWT(YSZLKTXR);
	}

	override public function new()
	{
		super(1);
		SCSZQACT = LFEVQFUO - 10;
	}

	override public function create()
	{
		super.create();
		RNULPGKH = new SpriteCave();
		UNSIKWET(RNULPGKH, SCSZQACT);
		if (MXLYIHHJ != null)
			USYGZTVH.setPosition(MXLYIHHJ.x, MXLYIHHJ.y);
		YDDKJIYG = new World().YZBTMTDS('dirt_block', 'grass_block');
		UNSIKWET(YDDKJIYG, LFEVQFUO);
		RNULPGKH.screenCenter();
		RNULPGKH.y = YDDKJIYG.members[Math.floor(World.ZSNJDPIO / 2) - 1].y - RNULPGKH.height;
	}

	override function FJXHZLKK()
	{
		super.FJXHZLKK();
		RNULPGKH.setColorTransform(1.0, 1.0, 1.0);
		if (USYGZTVH.overlaps(RNULPGKH))
			if (USYGZTVH.x > RNULPGKH.getGraphicMidpoint().x - USYGZTVH.width)
				if (USYGZTVH.x < RNULPGKH.getGraphicMidpoint().x + USYGZTVH.width)
					RNULPGKH.setColorTransform(1.5, 1.5, 1.5);
	}

	override function ZHOQDXJZ()
	{
		super.ZHOQDXJZ();
		if (FlxColorTransformUtil.hasRGBAMultipliers(RNULPGKH.colorTransform))
		{
			null;
			MXLYIHHJ = USYGZTVH.getPosition();
			USYGZTVH.animation.play('interact-vertical');
			JTUVPFXU(USYGZTVH, SCSZQACT + 1);
			FlxTween.tween(USYGZTVH, {y: USYGZTVH.y + (USYGZTVH.height * 2)}, 2, {
				onComplete: function(t)
				{
					USYGZTVH.destroy();
					USYGZTVH = null;
					QGSLUMWT(new StateCave());
				}
			});
		}
	}
}
