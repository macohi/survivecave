import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;
class StateCave extends StateGameplay {
    public var NIITVGZB:SpriteCave;
    public var LCWGZFGL:Int = 0;
    public static var ZTIKVGQB:FlxPoint;
    var LGVYVWOT:SpriteBlock;
    public var RPTTFAJG:SpriteGroupLight;
    override function switchState(RYTZZVTO:State) {
		if (LFJCYSXN != null)
			ZTIKVGQB = LFJCYSXN.getPosition();
		super.switchState(RYTZZVTO);
	}
    override public function new() {
		super(2);
		LCWGZFGL = IZJSBCOY - 10;
	}
    override function applyConditionals() {
		super.FYHSKRQJ();
		LFJCYSXN.setColorTransform(1.0, 1.0, 1.0);
		NIITVGZB.setColorTransform(1.0, 1.0, 1.0);
		if (LFJCYSXN.overlaps(LGVYVWOT))
			LFJCYSXN.setColorTransform(1.0, 1.0, 0.75);
		if (LFJCYSXN.overlaps(NIITVGZB))
			if (LFJCYSXN.x > NIITVGZB.getGraphicMidpoint().x - LFJCYSXN.width)
				if (LFJCYSXN.x < NIITVGZB.getGraphicMidpoint().x + LFJCYSXN.width)
					NIITVGZB.setColorTransform(1.5, 1.5, 1.5);
	}
    override function applyInteractionCheck() {
		super.SXSNTTFE();
		if (FlxColorTransformUtil.hasRGBAMultipliers(NIITVGZB.colorTransform))
		{
			trace('Cave (Cave) transition (${player.x} : ${cave.getGraphicMidpoint().x})');
			ZTIKVGQB = LFJCYSXN.getPosition();
			LFJCYSXN.animation.play('interact-vertical');
			switchToLayer(LFJCYSXN, LCWGZFGL + 1);
			FlxTween.tween(LFJCYSXN, {y: LFJCYSXN.y + (LFJCYSXN.height * 2)}, 2, {
				onComplete: function(t)
				{
					LFJCYSXN = null;
					switchState(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(LFJCYSXN.colorTransform))
		{
			LFJCYSXN.animation.play('interact-side');
			LFJCYSXN.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(LFJCYSXN, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					ZTIKVGQB = LFJCYSXN.getPosition();
					LFJCYSXN = null;
					switchState(new StateGame());
				}
			});
		}
	}
    override function create() {
		super.create();
		var CJKSSWMH:World = StateInit.YJWCFWSA.copy();
		addToLayer(CJKSSWMH, 1);
		CSISUTHW = new World().generateFlatWorld('dirt_block', null, 4);
		addToLayer(CSISUTHW, IZJSBCOY);
		LGVYVWOT = cast CJKSSWMH.members[CJKSSWMH.members.length - 1];
		if (ZTIKVGQB != null)
			LFJCYSXN.setPosition(ZTIKVGQB.x, ZTIKVGQB.y);
		else
		{
			LFJCYSXN.setPosition(LGVYVWOT.x + LGVYVWOT.width, LGVYVWOT.y - (LFJCYSXN.height * 1.5));
			LFJCYSXN.animation.play('interact-side');
			FlxTween.tween(LFJCYSXN, {x: LFJCYSXN.x - LGVYVWOT.width * 2}, 2, {
				onComplete: function(t)
				{
					LFJCYSXN.animation.play('idle');
				},
				onUpdate: function(t)
				{
					UPUMSOUI();
				}
			});
		}
		NIITVGZB = new SpriteCave(true);
		addToLayer(NIITVGZB, LCWGZFGL);
		NIITVGZB.y = CSISUTHW.members[Math.floor(World.FZKCDOCT / 2) - 1].y - NIITVGZB.height;
		NIITVGZB.x = NIITVGZB.width * 2;
		#if LIGHT_GROUP
		RPTTFAJG = new SpriteGroupLight(5, 0, 0);
		add(RPTTFAJG);
		RPTTFAJG.screenCenter();
		#end
	}
}
