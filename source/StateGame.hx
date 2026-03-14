import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var XKYCRVJD:SpriteCave;
	public var MDCFYOML:Int = 0;

	public static var KPNQYLUP:FlxPoint;

	override function LPFEOCHX(ABHONKTS:State)
	{
		if (EQNGZXSB != null)
			KPNQYLUP = EQNGZXSB.getPosition();
		super.LPFEOCHX(ABHONKTS);
	}

	override public function new()
	{
		super(1);
		MDCFYOML = UULKQGPJ - 10;
	}

	override public function create()
	{
		super.create();
		XKYCRVJD = new SpriteCave();
		QMSFUNDU(XKYCRVJD, MDCFYOML);
		if (KPNQYLUP != null)
			EQNGZXSB.setPosition(KPNQYLUP.x, KPNQYLUP.y);
		OUZKQHMZ = new World().DSNEDVEA('dirt_block', 'grass_block');
		QMSFUNDU(OUZKQHMZ, UULKQGPJ);
		XKYCRVJD.screenCenter();
		XKYCRVJD.y = OUZKQHMZ.members[Math.floor(World.WSNKGMOC / 2) - 1].y - XKYCRVJD.height;
	}

	override function XZBRTZJO()
	{
		super.XZBRTZJO();
		XKYCRVJD.setColorTransform(1.0, 1.0, 1.0);
		if (EQNGZXSB.overlaps(XKYCRVJD))
			if (EQNGZXSB.x > XKYCRVJD.getGraphicMidpoint().x - EQNGZXSB.width)
				if (EQNGZXSB.x < XKYCRVJD.getGraphicMidpoint().x + EQNGZXSB.width)
					XKYCRVJD.setColorTransform(1.5, 1.5, 1.5);
	}

	override function FPUCSHMQ()
	{
		super.FPUCSHMQ();
		if (FlxColorTransformUtil.hasRGBAMultipliers(XKYCRVJD.colorTransform))
		{
			null;
			KPNQYLUP = EQNGZXSB.getPosition();
			EQNGZXSB.animation.play('interact-vertical');
			IEYGRJCP(EQNGZXSB, MDCFYOML + 1);
			FlxTween.tween(EQNGZXSB, {y: EQNGZXSB.y + (EQNGZXSB.height * 2)}, 2, {
				onComplete: function(t)
				{
					EQNGZXSB.destroy();
					EQNGZXSB = null;
					LPFEOCHX(new StateCave());
				}
			});
		}
	}
}
