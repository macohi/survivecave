import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var ONAEQNCA:SpriteCave;
	public var EWQRCSZM:Int = 0;

	public static var KOZHXSBS:FlxPoint;

	override function LEFMGEJF(ZIDXGVVA:State)
	{
		if (YCLUEHCU != null)
			KOZHXSBS = YCLUEHCU.getPosition();
		super.LEFMGEJF(ZIDXGVVA);
	}

	override public function new()
	{
		super(1);
		EWQRCSZM = CJGMCCZE - 10;
	}

	override public function create()
	{
		super.create();
		ONAEQNCA = new SpriteCave();
		SMIXXKUZ(ONAEQNCA, EWQRCSZM);
		if (KOZHXSBS != null)
			YCLUEHCU.setPosition(KOZHXSBS.x, KOZHXSBS.y);
		ICBWJFOZ = new World().MWTQPKYK('dirt_block', 'grass_block');
		SMIXXKUZ(ICBWJFOZ, CJGMCCZE);
		ONAEQNCA.screenCenter();
		ONAEQNCA.y = ICBWJFOZ.members[Math.floor(World.QLUONJYQ / 2) - 1].y - ONAEQNCA.height;
	}

	override function DDKDRETF()
	{
		super.DDKDRETF();
		ONAEQNCA.setColorTransform(1.0, 1.0, 1.0);
		if (YCLUEHCU.overlaps(ONAEQNCA))
			if (YCLUEHCU.x > ONAEQNCA.getGraphicMidpoint().x - YCLUEHCU.width)
				if (YCLUEHCU.x < ONAEQNCA.getGraphicMidpoint().x + YCLUEHCU.width)
					ONAEQNCA.setColorTransform(1.5, 1.5, 1.5);
	}

	override function MXCPDVBA()
	{
		super.MXCPDVBA();
		if (FlxColorTransformUtil.hasRGBAMultipliers(ONAEQNCA.colorTransform))
		{
			null;
			KOZHXSBS = YCLUEHCU.getPosition();
			YCLUEHCU.animation.play('interact-vertical');
			DMHZLXCO(YCLUEHCU, EWQRCSZM + 1);
			FlxTween.tween(YCLUEHCU, {y: YCLUEHCU.y + (YCLUEHCU.height * 2)}, 2, {
				onComplete: function(t)
				{
					YCLUEHCU.destroy();
					YCLUEHCU = null;
					LEFMGEJF(new StateCave());
				}
			});
		}
	}
}
