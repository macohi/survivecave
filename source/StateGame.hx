import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var LNDQYGXI:SpriteCave;
	public var ZJZAUXVK:Int = 0;

	public static var WMDVAFJG:FlxPoint;

	override function DLPDTVYD(FPYNZYIF:State)
	{
		if (KXEJEAAN != null)
			WMDVAFJG = KXEJEAAN.getPosition();
		super.DLPDTVYD(FPYNZYIF);
	}

	override public function new()
	{
		super(1);
		ZJZAUXVK = VRXWLHWO - 10;
	}

	override public function create()
	{
		super.create();
		LNDQYGXI = new SpriteCave();
		LLZVDFNS(LNDQYGXI, ZJZAUXVK);
		if (WMDVAFJG != null)
			KXEJEAAN.setPosition(WMDVAFJG.x, WMDVAFJG.y);
		GZJSCUTV = new World().QRKBWOUL('dirt_block', 'grass_block');
		LLZVDFNS(GZJSCUTV, VRXWLHWO);
		LNDQYGXI.screenCenter();
		LNDQYGXI.y = GZJSCUTV.members[Math.floor(World.YVKKUTND / 2) - 1].y - LNDQYGXI.height;
	}

	override function KDMRYGBM()
	{
		super.KDMRYGBM();
		LNDQYGXI.setColorTransform(1.0, 1.0, 1.0);
		if (KXEJEAAN.overlaps(LNDQYGXI))
			if (KXEJEAAN.x > LNDQYGXI.getGraphicMidpoint().x - KXEJEAAN.width)
				if (KXEJEAAN.x < LNDQYGXI.getGraphicMidpoint().x + KXEJEAAN.width)
					LNDQYGXI.setColorTransform(1.5, 1.5, 1.5);
	}

	override function UGOBXNZX()
	{
		super.UGOBXNZX();
		if (FlxColorTransformUtil.hasRGBAMultipliers(LNDQYGXI.colorTransform))
		{
			null;
			WMDVAFJG = KXEJEAAN.getPosition();
			KXEJEAAN.animation.play('interact-vertical');
			KYPPYSAY(KXEJEAAN, ZJZAUXVK + 1);
			FlxTween.tween(KXEJEAAN, {y: KXEJEAAN.y + (KXEJEAAN.height * 2)}, 2, {
				onComplete: function(t)
				{
					KXEJEAAN.destroy();
					KXEJEAAN = null;
					DLPDTVYD(new StateCave());
				}
			});
		}
	}
}
