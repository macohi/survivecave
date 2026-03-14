import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var NONOEILT:SpriteCave;
	public var JSHNOPJQ:Int = 0;

	public static var MMHUZBWE:FlxPoint;

	var TRZGBMTS:SpriteBlock;

	public var GYFWNMQY:SpriteGroupLight;

	override function DLPDTVYD(EBCOUJWO:State)
	{
		if (KXEJEAAN != null)
			MMHUZBWE = KXEJEAAN.getPosition();
		super.DLPDTVYD(EBCOUJWO);
	}

	override public function new()
	{
		super(2);
		JSHNOPJQ = VRXWLHWO - 10;
	}

	override function KDMRYGBM()
	{
		super.KDMRYGBM();
		KXEJEAAN.setColorTransform(1.0, 1.0, 1.0);
		NONOEILT.setColorTransform(1.0, 1.0, 1.0);
		if (KXEJEAAN.overlaps(TRZGBMTS))
			KXEJEAAN.setColorTransform(1.0, 1.0, 0.75);
		if (KXEJEAAN.overlaps(NONOEILT))
			if (KXEJEAAN.x > NONOEILT.getGraphicMidpoint().x - KXEJEAAN.width)
				if (KXEJEAAN.x < NONOEILT.getGraphicMidpoint().x + KXEJEAAN.width)
					NONOEILT.setColorTransform(1.5, 1.5, 1.5);
	}

	override function UGOBXNZX()
	{
		super.UGOBXNZX();
		if (FlxColorTransformUtil.hasRGBAMultipliers(NONOEILT.colorTransform))
		{
			null;
			MMHUZBWE = KXEJEAAN.getPosition();
			KXEJEAAN.animation.play('interact-vertical');
			KYPPYSAY(KXEJEAAN, JSHNOPJQ + 1);
			FlxTween.tween(KXEJEAAN, {y: KXEJEAAN.y + (KXEJEAAN.height * 2)}, 2, {
				onComplete: function(t)
				{
					KXEJEAAN = null;
					DLPDTVYD(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(KXEJEAAN.colorTransform))
		{
			KXEJEAAN.animation.play('interact-side');
			KXEJEAAN.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(KXEJEAAN, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					MMHUZBWE = KXEJEAAN.getPosition();
					KXEJEAAN = null;
					DLPDTVYD(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var CCMFGAOJ:World = StateInit.JHCNYTRT.TWPVWWMA();
		LLZVDFNS(CCMFGAOJ, 1);
		GZJSCUTV = new World().QRKBWOUL('dirt_block', null, 4);
		LLZVDFNS(GZJSCUTV, VRXWLHWO);
		TRZGBMTS = cast CCMFGAOJ.members[CCMFGAOJ.members.length - 1];
		if (MMHUZBWE != null)
			KXEJEAAN.setPosition(MMHUZBWE.x, MMHUZBWE.y);
		else
		{
			KXEJEAAN.setPosition(TRZGBMTS.x + TRZGBMTS.width, TRZGBMTS.y - (KXEJEAAN.height * 1.5));
			KXEJEAAN.animation.play('interact-side');
			FlxTween.tween(KXEJEAAN, {x: KXEJEAAN.x - TRZGBMTS.width * 2}, 2, {
				onComplete: function(t)
				{
					KXEJEAAN.animation.play('idle');
				},
				onUpdate: function(t)
				{
					SMMANXKN();
				}
			});
		}
		NONOEILT = new SpriteCave(true);
		LLZVDFNS(NONOEILT, JSHNOPJQ);
		NONOEILT.y = GZJSCUTV.members[Math.floor(World.YVKKUTND / 2) - 1].y - NONOEILT.height;
		NONOEILT.x = NONOEILT.width * 2;
		#if LIGHT_GROUP
		GYFWNMQY = new SpriteGroupLight(5, 0, 0);
		add(GYFWNMQY);
		GYFWNMQY.screenCenter();
		#end
	}
}
