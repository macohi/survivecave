import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;

class StateGame extends StateGameplay
{
	public var HDREEXRV:SpriteCave;
	public var KPHUALTL:Int = 0;

	public static var TCXITMTU:FlxPoint;

	override function switchState(CDNMBUMC:State)
	{
		if (DQPTYXZZ != null)
			TCXITMTU = DQPTYXZZ.getPosition();
		super.switchState(CDNMBUMC);
	}

	override public function new()
	{
		super(1);
		KPHUALTL = VZKXZQRP - 10;
	}

	override public function create()
	{
		super.create();
		HDREEXRV = new SpriteCave();
		addToLayer(HDREEXRV, KPHUALTL);
		if (TCXITMTU != null)
			DQPTYXZZ.setPosition(TCXITMTU.x, TCXITMTU.y);
		BRXDRKOP = new World().generateFlatWorld('dirt_block', 'grass_block');
		addToLayer(BRXDRKOP, VZKXZQRP);
		HDREEXRV.screenCenter();
		HDREEXRV.y = BRXDRKOP.members[Math.floor(World.OHBQOIJU / 2) - 1].y - HDREEXRV.height;
	}

	override function applyConditionals()
	{
		super.OXTYSUOK();
		HDREEXRV.setColorTransform(1.0, 1.0, 1.0);
		if (DQPTYXZZ.overlaps(HDREEXRV))
			if (DQPTYXZZ.x > HDREEXRV.getGraphicMidpoint().x - DQPTYXZZ.width)
				if (DQPTYXZZ.x < HDREEXRV.getGraphicMidpoint().x + DQPTYXZZ.width)
					HDREEXRV.setColorTransform(1.5, 1.5, 1.5);
	}

	override function applyInteractionCheck()
	{
		super.PXWBVPVV();
		if (FlxColorTransformUtil.hasRGBAMultipliers(HDREEXRV.colorTransform))
		{
			trace('Cave transition (${DQPTYXZZ.x} : ${HDREEXRV.getGraphicMidpoint().x})');
			TCXITMTU = DQPTYXZZ.getPosition();
			DQPTYXZZ.animation.play('interact-vertical');
			switchToLayer(DQPTYXZZ, KPHUALTL + 1);
			FlxTween.tween(DQPTYXZZ, {y: DQPTYXZZ.y + (DQPTYXZZ.height * 2)}, 2, {
				onComplete: function(t)
				{
					DQPTYXZZ.destroy();
					DQPTYXZZ = null;
					switchState(new StateCave());
				}
			});
		}
	}
}
