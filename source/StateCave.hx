import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var TZZAMGKU:SpriteCave;
	public var EXHUBJAK:Int = 0;

	public static var LBJRLGXH:FlxPoint;

	var AFVHNZPE:SpriteBlock;

	public var ATTBSTFZ:SpriteGroupLight;

	override function SUEEHYDO(DXFFFSAE:State)
	{
		if (FHEFVSOO != null)
			LBJRLGXH = FHEFVSOO.getPosition();
		super.SUEEHYDO(DXFFFSAE);
	}

	override public function new()
	{
		super(2);
		EXHUBJAK = JIZDMJTB - 10;
	}

	override function MXSOJUNT()
	{
		super.MXSOJUNT();
		FHEFVSOO.setColorTransform(1.0, 1.0, 1.0);
		TZZAMGKU.setColorTransform(1.0, 1.0, 1.0);
		if (FHEFVSOO.overlaps(AFVHNZPE))
			FHEFVSOO.setColorTransform(1.0, 1.0, 0.75);
		if (FHEFVSOO.overlaps(TZZAMGKU))
			if (FHEFVSOO.x > TZZAMGKU.getGraphicMidpoint().x - FHEFVSOO.width)
				if (FHEFVSOO.x < TZZAMGKU.getGraphicMidpoint().x + FHEFVSOO.width)
					TZZAMGKU.setColorTransform(1.5, 1.5, 1.5);
	}

	override function YYFCAJIG()
	{
		super.YYFCAJIG();
		if (FlxColorTransformUtil.hasRGBAMultipliers(TZZAMGKU.colorTransform))
		{
			trace('Cave (Cave) transition (${FHEFVSOO.x} : ${TZZAMGKU.getGraphicMidpoint().x})');
			LBJRLGXH = FHEFVSOO.getPosition();
			FHEFVSOO.animation.play('interact-vertical');
			SYUTTAOP(FHEFVSOO, EXHUBJAK + 1);
			FlxTween.tween(FHEFVSOO, {y: FHEFVSOO.y + (FHEFVSOO.height * 2)}, 2, {
				onComplete: function(t)
				{
					FHEFVSOO = null;
					SUEEHYDO(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(FHEFVSOO.colorTransform))
		{
			FHEFVSOO.animation.play('interact-side');
			FHEFVSOO.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(FHEFVSOO, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					LBJRLGXH = FHEFVSOO.getPosition();
					FHEFVSOO = null;
					SUEEHYDO(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var YJFTBZBR:World = StateInit.GTPAJLFZ.copy();
		GWBTGWNX(YJFTBZBR, 1);
		HMXJJCJW = new World().AOLKYSBN('dirt_block', null, 4);
		GWBTGWNX(HMXJJCJW, JIZDMJTB);
		AFVHNZPE = cast YJFTBZBR.members[YJFTBZBR.members.length - 1];
		if (LBJRLGXH != null)
			FHEFVSOO.setPosition(LBJRLGXH.x, LBJRLGXH.y);
		else
		{
			FHEFVSOO.setPosition(AFVHNZPE.x + AFVHNZPE.width, AFVHNZPE.y - (FHEFVSOO.height * 1.5));
			FHEFVSOO.animation.play('interact-side');
			FlxTween.tween(FHEFVSOO, {x: FHEFVSOO.x - AFVHNZPE.width * 2}, 2, {
				onComplete: function(t)
				{
					FHEFVSOO.animation.play('idle');
				},
				onUpdate: function(t)
				{
					WVSWXAPI();
				}
			});
		}
		TZZAMGKU = new SpriteCave(true);
		GWBTGWNX(TZZAMGKU, EXHUBJAK);
		TZZAMGKU.y = HMXJJCJW.members[Math.floor(World.UNXNIRGX / 2) - 1].y - TZZAMGKU.height;
		TZZAMGKU.x = TZZAMGKU.width * 2;
		#if LIGHT_GROUP
		ATTBSTFZ = new SpriteGroupLight(5, 0, 0);
		add(ATTBSTFZ);
		ATTBSTFZ.screenCenter();
		#end
	}
}
