import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var DJQMCXWV:SpriteCave;
	public var LPNUILNM:Int = 0;

	public static var FNBRVCGH:FlxPoint;

	var LZWNRCJR:SpriteBlock;

	public var CIRJKFKF:SpriteGroupLight;

	override function switchState(ELPAHWTA:State)
	{
		if (DQPTYXZZ != null)
			FNBRVCGH = DQPTYXZZ.getPosition();
		super.switchState(ELPAHWTA);
	}

	override public function new()
	{
		super(2);
		LPNUILNM = VZKXZQRP - 10;
	}

	override function applyConditionals()
	{
		super.OXTYSUOK();
		DQPTYXZZ.setColorTransform(1.0, 1.0, 1.0);
		DJQMCXWV.setColorTransform(1.0, 1.0, 1.0);
		if (DQPTYXZZ.overlaps(LZWNRCJR))
			DQPTYXZZ.setColorTransform(1.0, 1.0, 0.75);
		if (DQPTYXZZ.overlaps(DJQMCXWV))
			if (DQPTYXZZ.x > DJQMCXWV.getGraphicMidpoint().x - DQPTYXZZ.width)
				if (DQPTYXZZ.x < DJQMCXWV.getGraphicMidpoint().x + DQPTYXZZ.width)
					DJQMCXWV.setColorTransform(1.5, 1.5, 1.5);
	}

	override function applyInteractionCheck()
	{
		super.PXWBVPVV();
		if (FlxColorTransformUtil.hasRGBAMultipliers(DJQMCXWV.colorTransform))
		{
			trace('Cave (Cave) transition (${DQPTYXZZ.x} : ${DJQMCXWV.getGraphicMidpoint().x})');
			FNBRVCGH = DQPTYXZZ.getPosition();
			DQPTYXZZ.animation.play('interact-vertical');
			switchToLayer(DQPTYXZZ, LPNUILNM + 1);
			FlxTween.tween(DQPTYXZZ, {y: DQPTYXZZ.y + (DQPTYXZZ.height * 2)}, 2, {
				onComplete: function(t)
				{
					DQPTYXZZ = null;
					switchState(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(DQPTYXZZ.colorTransform))
		{
			DQPTYXZZ.animation.play('interact-side');
			DQPTYXZZ.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(DQPTYXZZ, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					FNBRVCGH = DQPTYXZZ.getPosition();
					DQPTYXZZ = null;
					switchState(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var AMLZNJPM:World = StateInit.YXZNGWDJ.copy();
		addToLayer(AMLZNJPM, 1);
		BRXDRKOP = new World().generateFlatWorld('dirt_block', null, 4);
		addToLayer(BRXDRKOP, VZKXZQRP);
		LZWNRCJR = cast AMLZNJPM.members[AMLZNJPM.members.length - 1];
		if (FNBRVCGH != null)
			DQPTYXZZ.setPosition(FNBRVCGH.x, FNBRVCGH.y);
		else
		{
			DQPTYXZZ.setPosition(LZWNRCJR.x + LZWNRCJR.width, LZWNRCJR.y - (DQPTYXZZ.height * 1.5));
			DQPTYXZZ.animation.play('interact-side');
			FlxTween.tween(DQPTYXZZ, {x: DQPTYXZZ.x - LZWNRCJR.width * 2}, 2, {
				onComplete: function(t)
				{
					DQPTYXZZ.animation.play('idle');
				},
				onUpdate: function(t)
				{
					SAAVDYZH();
				}
			});
		}
		DJQMCXWV = new SpriteCave(true);
		addToLayer(DJQMCXWV, LPNUILNM);
		DJQMCXWV.y = BRXDRKOP.members[Math.floor(World.OHBQOIJU / 2) - 1].y - DJQMCXWV.height;
		DJQMCXWV.x = DJQMCXWV.width * 2;
		#if LIGHT_GROUP
		CIRJKFKF = new SpriteGroupLight(5, 0, 0);
		add(CIRJKFKF);
		CIRJKFKF.screenCenter();
		#end
	}
}
