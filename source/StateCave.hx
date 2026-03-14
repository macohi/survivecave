import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var dede:SpriteCave;
	public var edkk:Int = 0;

	public static var keek:FlxPoint;

	var kekd:SpriteBlock;

	public var dakd:SpriteGroupLight;

	override function eedk(kekk:State)
	{
		if (eeak != null)
			keek = eeak.getPosition();
		super.eedk(kekk);
	}

	override public function new()
	{
		super(2);
		edkk = aada - 10;
	}

	override function ddke()
	{
		super.ddke();
		eeak.setColorTransform(1.0, 1.0, 1.0);
		dede.setColorTransform(1.0, 1.0, 1.0);
		if (eeak.overlaps(kekd))
			eeak.setColorTransform(1.0, 1.0, 0.75);
		if (eeak.overlaps(dede))
			if (eeak.x > dede.getGraphicMidpoint().x - eeak.width)
				if (eeak.x < dede.getGraphicMidpoint().x + eeak.width)
					dede.setColorTransform(1.5, 1.5, 1.5);
	}

	override function eake()
	{
		super.eake();
		if (FlxColorTransformUtil.hasRGBAMultipliers(dede.colorTransform))
		{
			null;
			keek = eeak.getPosition();
			eeak.animation.play('interact-vertical');
			aakk(eeak, edkk + 1);
			FlxTween.tween(eeak, {y: eeak.y + (eeak.height * 2)}, 2, {
				onComplete: function(t)
				{
					eeak = null;
					eedk(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(eeak.colorTransform))
		{
			eeak.animation.play('interact-side');
			eeak.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(eeak, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					keek = eeak.getPosition();
					eeak = null;
					eedk(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var ekke:World = StateInit.kake.kdke();
		akad(ekke, 1);
		aedd = new World().adda('dirt_block', null, 4);
		akad(aedd, aada);
		kekd = cast ekke.members[ekke.members.length - 1];
		if (keek != null)
			eeak.setPosition(keek.x, keek.y);
		else
		{
			eeak.setPosition(kekd.x + kekd.width, kekd.y - (eeak.height * 1.5));
			eeak.animation.play('interact-side');
			FlxTween.tween(eeak, {x: eeak.x - kekd.width * 2}, 2, {
				onComplete: function(t)
				{
					eeak.animation.play('idle');
				},
				onUpdate: function(t)
				{
					dkda();
				}
			});
		}
		dede = new SpriteCave(true);
		akad(dede, edkk);
		dede.y = aedd.members[Math.floor(World.keaa / 2) - 1].y - dede.height;
		dede.x = dede.width * 2;
		#if LIGHT_GROUP
		dakd = new SpriteGroupLight(5, 0, 0);
		add(dakd);
		dakd.screenCenter();
		#end
	}
}
