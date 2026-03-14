import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
class StateGame extends StateGameplay {
    public var ULEBKNUP:SpriteCave;
    public var VDCSYPVI:Int = 0;
    public static var QSZELBOW:FlxPoint;
    override function switchState(HQKKRFNP:State) {
		if (LFJCYSXN != null)
			QSZELBOW = LFJCYSXN.getPosition();
		super.switchState(HQKKRFNP);
	}
    override public function new() {
		super(1);
		VDCSYPVI = IZJSBCOY - 10;
	}
    override public function create() {
		super.create();
		ULEBKNUP = new SpriteCave();
		addToLayer(ULEBKNUP, VDCSYPVI);
		if (QSZELBOW != null)
			LFJCYSXN.setPosition(QSZELBOW.x, QSZELBOW.y);
		CSISUTHW = new World().generateFlatWorld('dirt_block', 'grass_block');
		addToLayer(CSISUTHW, IZJSBCOY);
		ULEBKNUP.screenCenter();
		ULEBKNUP.y = CSISUTHW.members[Math.floor(World.FZKCDOCT / 2) - 1].y - ULEBKNUP.height;
	}
    override function applyConditionals() {
		super.FYHSKRQJ();
		ULEBKNUP.setColorTransform(1.0, 1.0, 1.0);
		if (LFJCYSXN.overlaps(ULEBKNUP))
			if (LFJCYSXN.x > ULEBKNUP.getGraphicMidpoint().x - LFJCYSXN.width)
				if (LFJCYSXN.x < ULEBKNUP.getGraphicMidpoint().x + LFJCYSXN.width)
					ULEBKNUP.setColorTransform(1.5, 1.5, 1.5);
	}
    override function applyInteractionCheck() {
		super.SXSNTTFE();
		if (FlxColorTransformUtil.hasRGBAMultipliers(ULEBKNUP.colorTransform))
		{
			trace('Cave transition (${player.x} : ${cave.getGraphicMidpoint().x})');
			QSZELBOW = LFJCYSXN.getPosition();
			LFJCYSXN.animation.play('interact-vertical');
			switchToLayer(LFJCYSXN, VDCSYPVI + 1);
			FlxTween.tween(LFJCYSXN, {y: LFJCYSXN.y + (LFJCYSXN.height * 2)}, 2, {
				onComplete: function(t)
				{
					LFJCYSXN.destroy();
					LFJCYSXN = null;
					switchState(new StateCave());
				}
			});
		}
	}
}
