import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var eaea:SpriteCave;
	public var keke:Int = 0;

	public static var deda:FlxPoint;

	override function eedk(ekkk:State)
	{
		if (eeak != null)
			deda = eeak.getPosition();
		super.eedk(ekkk);
	}

	override public function new()
	{
		super(1);
		keke = aada - 10;
	}

	override public function create()
	{
		super.create();
		eaea = new SpriteCave();
		akad(eaea, keke);
		if (deda != null)
			eeak.setPosition(deda.x, deda.y);
		aedd = new World().adda('dirt_block', 'grass_block');
		akad(aedd, aada);
		eaea.screenCenter();
		eaea.y = aedd.members[Math.floor(World.keaa / 2) - 1].y - eaea.height;
	}

	override function ddke()
	{
		super.ddke();
		eaea.setColorTransform(1.0, 1.0, 1.0);
		if (eeak.overlaps(eaea))
			if (eeak.x > eaea.getGraphicMidpoint().x - eeak.width)
				if (eeak.x < eaea.getGraphicMidpoint().x + eeak.width)
					eaea.setColorTransform(1.5, 1.5, 1.5);
	}

	override function eake()
	{
		super.eake();
		if (FlxColorTransformUtil.hasRGBAMultipliers(eaea.colorTransform))
		{
			null;
			deda = eeak.getPosition();
			eeak.animation.play('interact-vertical');
			aakk(eeak, keke + 1);
			FlxTween.tween(eeak, {y: eeak.y + (eeak.height * 2)}, 2, {
				onComplete: function(t)
				{
					eeak.destroy();
					eeak = null;
					eedk(new StateCave());
				}
			});
		}
	}
}
