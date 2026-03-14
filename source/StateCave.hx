import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var LBYNYKWP:SpriteCave;
	public var OWBURBGJ:Int = 0;

	public static var GCOTKQQF:FlxPoint;

	var KGGCTOHK:SpriteBlock;

	public var AWTXVFIX:SpriteGroupLight;

	override function LEFMGEJF(FFUSQPBA:State)
	{
		if (YCLUEHCU != null)
			GCOTKQQF = YCLUEHCU.getPosition();
		super.LEFMGEJF(FFUSQPBA);
	}

	override public function new()
	{
		super(2);
		OWBURBGJ = CJGMCCZE - 10;
	}

	override function DDKDRETF()
	{
		super.DDKDRETF();
		YCLUEHCU.setColorTransform(1.0, 1.0, 1.0);
		LBYNYKWP.setColorTransform(1.0, 1.0, 1.0);
		if (YCLUEHCU.overlaps(KGGCTOHK))
			YCLUEHCU.setColorTransform(1.0, 1.0, 0.75);
		if (YCLUEHCU.overlaps(LBYNYKWP))
			if (YCLUEHCU.x > LBYNYKWP.getGraphicMidpoint().x - YCLUEHCU.width)
				if (YCLUEHCU.x < LBYNYKWP.getGraphicMidpoint().x + YCLUEHCU.width)
					LBYNYKWP.setColorTransform(1.5, 1.5, 1.5);
	}

	override function MXCPDVBA()
	{
		super.MXCPDVBA();
		if (FlxColorTransformUtil.hasRGBAMultipliers(LBYNYKWP.colorTransform))
		{
			null;
			GCOTKQQF = YCLUEHCU.getPosition();
			YCLUEHCU.animation.play('interact-vertical');
			DMHZLXCO(YCLUEHCU, OWBURBGJ + 1);
			FlxTween.tween(YCLUEHCU, {y: YCLUEHCU.y + (YCLUEHCU.height * 2)}, 2, {
				onComplete: function(t)
				{
					YCLUEHCU = null;
					LEFMGEJF(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(YCLUEHCU.colorTransform))
		{
			YCLUEHCU.animation.play('interact-side');
			YCLUEHCU.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(YCLUEHCU, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					GCOTKQQF = YCLUEHCU.getPosition();
					YCLUEHCU = null;
					LEFMGEJF(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var NXWIQXBF:World = StateInit.RAHBKKUK.FFKQWGWD();
		SMIXXKUZ(NXWIQXBF, 1);
		ICBWJFOZ = new World().MWTQPKYK('dirt_block', null, 4);
		SMIXXKUZ(ICBWJFOZ, CJGMCCZE);
		KGGCTOHK = cast NXWIQXBF.members[NXWIQXBF.members.length - 1];
		if (GCOTKQQF != null)
			YCLUEHCU.setPosition(GCOTKQQF.x, GCOTKQQF.y);
		else
		{
			YCLUEHCU.setPosition(KGGCTOHK.x + KGGCTOHK.width, KGGCTOHK.y - (YCLUEHCU.height * 1.5));
			YCLUEHCU.animation.play('interact-side');
			FlxTween.tween(YCLUEHCU, {x: YCLUEHCU.x - KGGCTOHK.width * 2}, 2, {
				onComplete: function(t)
				{
					YCLUEHCU.animation.play('idle');
				},
				onUpdate: function(t)
				{
					SPCNUHIZ();
				}
			});
		}
		LBYNYKWP = new SpriteCave(true);
		SMIXXKUZ(LBYNYKWP, OWBURBGJ);
		LBYNYKWP.y = ICBWJFOZ.members[Math.floor(World.QLUONJYQ / 2) - 1].y - LBYNYKWP.height;
		LBYNYKWP.x = LBYNYKWP.width * 2;
		#if LIGHT_GROUP
		AWTXVFIX = new SpriteGroupLight(5, 0, 0);
		add(AWTXVFIX);
		AWTXVFIX.screenCenter();
		#end
	}
}
