import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var SYUFZXBW:SpriteCave;
	public var NZNQRNVY:Int = 0;

	public static var FJKIDAZZ:FlxPoint;

	var UDSFPTJN:SpriteBlock;

	public var FBTMJFYN:SpriteGroupLight;

	override function QGSLUMWT(QILSTDCV:State)
	{
		if (USYGZTVH != null)
			FJKIDAZZ = USYGZTVH.getPosition();
		super.QGSLUMWT(QILSTDCV);
	}

	override public function new()
	{
		super(2);
		NZNQRNVY = LFEVQFUO - 10;
	}

	override function FJXHZLKK()
	{
		super.FJXHZLKK();
		USYGZTVH.setColorTransform(1.0, 1.0, 1.0);
		SYUFZXBW.setColorTransform(1.0, 1.0, 1.0);
		if (USYGZTVH.overlaps(UDSFPTJN))
			USYGZTVH.setColorTransform(1.0, 1.0, 0.75);
		if (USYGZTVH.overlaps(SYUFZXBW))
			if (USYGZTVH.x > SYUFZXBW.getGraphicMidpoint().x - USYGZTVH.width)
				if (USYGZTVH.x < SYUFZXBW.getGraphicMidpoint().x + USYGZTVH.width)
					SYUFZXBW.setColorTransform(1.5, 1.5, 1.5);
	}

	override function ZHOQDXJZ()
	{
		super.ZHOQDXJZ();
		if (FlxColorTransformUtil.hasRGBAMultipliers(SYUFZXBW.colorTransform))
		{
			null;
			FJKIDAZZ = USYGZTVH.getPosition();
			USYGZTVH.animation.play('interact-vertical');
			JTUVPFXU(USYGZTVH, NZNQRNVY + 1);
			FlxTween.tween(USYGZTVH, {y: USYGZTVH.y + (USYGZTVH.height * 2)}, 2, {
				onComplete: function(t)
				{
					USYGZTVH = null;
					QGSLUMWT(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(USYGZTVH.colorTransform))
		{
			USYGZTVH.animation.play('interact-side');
			USYGZTVH.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(USYGZTVH, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					FJKIDAZZ = USYGZTVH.getPosition();
					USYGZTVH = null;
					QGSLUMWT(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var VROOBVHG:World = StateInit.EZPWWBQF.YGBBNRFU();
		UNSIKWET(VROOBVHG, 1);
		YDDKJIYG = new World().YZBTMTDS('dirt_block', null, 4);
		UNSIKWET(YDDKJIYG, LFEVQFUO);
		UDSFPTJN = cast VROOBVHG.members[VROOBVHG.members.length - 1];
		if (FJKIDAZZ != null)
			USYGZTVH.setPosition(FJKIDAZZ.x, FJKIDAZZ.y);
		else
		{
			USYGZTVH.setPosition(UDSFPTJN.x + UDSFPTJN.width, UDSFPTJN.y - (USYGZTVH.height * 1.5));
			USYGZTVH.animation.play('interact-side');
			FlxTween.tween(USYGZTVH, {x: USYGZTVH.x - UDSFPTJN.width * 2}, 2, {
				onComplete: function(t)
				{
					USYGZTVH.animation.play('idle');
				},
				onUpdate: function(t)
				{
					ZDYWVDPK();
				}
			});
		}
		SYUFZXBW = new SpriteCave(true);
		UNSIKWET(SYUFZXBW, NZNQRNVY);
		SYUFZXBW.y = YDDKJIYG.members[Math.floor(World.ZSNJDPIO / 2) - 1].y - SYUFZXBW.height;
		SYUFZXBW.x = SYUFZXBW.width * 2;
		#if LIGHT_GROUP
		FBTMJFYN = new SpriteGroupLight(5, 0, 0);
		add(FBTMJFYN);
		FBTMJFYN.screenCenter();
		#end
	}
}
