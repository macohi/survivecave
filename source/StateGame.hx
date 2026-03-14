import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var FJWLFRVP:SpriteCave;
	public var VDIUFWWV:Int = 0;

	public static var XVCUXZWV:FlxPoint;

	override function switchState(WLBIPOTI:State)
	{
		if (FHEFVSOO != null)
			XVCUXZWV = FHEFVSOO.getPosition();
		super.switchState(WLBIPOTI);
	}

	override public function new()
	{
		super(1);
		VDIUFWWV = JIZDMJTB - 10;
	}

	override public function create()
	{
		super.create();
		FJWLFRVP = new SpriteCave();
		addToLayer(FJWLFRVP, VDIUFWWV);
		if (XVCUXZWV != null)
			FHEFVSOO.setPosition(XVCUXZWV.x, XVCUXZWV.y);
		HMXJJCJW = new World().generateFlatWorld('dirt_block', 'grass_block');
		addToLayer(HMXJJCJW, JIZDMJTB);
		FJWLFRVP.screenCenter();
		FJWLFRVP.y = HMXJJCJW.members[Math.floor(World.UNXNIRGX / 2) - 1].y - FJWLFRVP.height;
	}

	override function applyConditionals()
	{
		super.MXSOJUNT();
		FJWLFRVP.setColorTransform(1.0, 1.0, 1.0);
		if (FHEFVSOO.overlaps(FJWLFRVP))
			if (FHEFVSOO.x > FJWLFRVP.getGraphicMidpoint().x - FHEFVSOO.width)
				if (FHEFVSOO.x < FJWLFRVP.getGraphicMidpoint().x + FHEFVSOO.width)
					FJWLFRVP.setColorTransform(1.5, 1.5, 1.5);
	}

	override function applyInteractionCheck()
	{
		super.YYFCAJIG();
		if (FlxColorTransformUtil.hasRGBAMultipliers(FJWLFRVP.colorTransform))
		{
			trace('Cave transition (${player.x} : ${cave.getGraphicMidpoint().x})');
			XVCUXZWV = FHEFVSOO.getPosition();
			FHEFVSOO.animation.play('interact-vertical');
			switchToLayer(FHEFVSOO, VDIUFWWV + 1);
			FlxTween.tween(FHEFVSOO, {y: FHEFVSOO.y + (FHEFVSOO.height * 2)}, 2, {
				onComplete: function(t)
				{
					FHEFVSOO.destroy();
					FHEFVSOO = null;
					switchState(new StateCave());
				}
			});
		}
	}
}
