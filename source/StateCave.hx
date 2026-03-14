import flixel.math.FlxPoint;
import flixel.util.FlxColorTransformUtil;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class StateCave extends StateGameplay
{
	public var LAAGUQCU:SpriteCave;
	public var TYLBPKHJ:Int = 0;

	public static var LTHBVKWA:FlxPoint;

	var UGVMSFRP:SpriteBlock;

	public var HFXXJZTR:SpriteGroupLight;

	override function LPFEOCHX(VCRKNGFI:State)
	{
		if (EQNGZXSB != null)
			LTHBVKWA = EQNGZXSB.getPosition();
		super.LPFEOCHX(VCRKNGFI);
	}

	override public function new()
	{
		super(2);
		TYLBPKHJ = UULKQGPJ - 10;
	}

	override function XZBRTZJO()
	{
		super.XZBRTZJO();
		EQNGZXSB.setColorTransform(1.0, 1.0, 1.0);
		LAAGUQCU.setColorTransform(1.0, 1.0, 1.0);
		if (EQNGZXSB.overlaps(UGVMSFRP))
			EQNGZXSB.setColorTransform(1.0, 1.0, 0.75);
		if (EQNGZXSB.overlaps(LAAGUQCU))
			if (EQNGZXSB.x > LAAGUQCU.getGraphicMidpoint().x - EQNGZXSB.width)
				if (EQNGZXSB.x < LAAGUQCU.getGraphicMidpoint().x + EQNGZXSB.width)
					LAAGUQCU.setColorTransform(1.5, 1.5, 1.5);
	}

	override function FPUCSHMQ()
	{
		super.FPUCSHMQ();
		if (FlxColorTransformUtil.hasRGBAMultipliers(LAAGUQCU.colorTransform))
		{
			null;
			LTHBVKWA = EQNGZXSB.getPosition();
			EQNGZXSB.animation.play('interact-vertical');
			IEYGRJCP(EQNGZXSB, TYLBPKHJ + 1);
			FlxTween.tween(EQNGZXSB, {y: EQNGZXSB.y + (EQNGZXSB.height * 2)}, 2, {
				onComplete: function(t)
				{
					EQNGZXSB = null;
					LPFEOCHX(new StateCave());
				}
			});
		}
		if (FlxColorTransformUtil.hasRGBAMultipliers(EQNGZXSB.colorTransform))
		{
			EQNGZXSB.animation.play('interact-side');
			EQNGZXSB.setColorTransform(1.0, 1.0, 1.0);
			FlxTween.tween(EQNGZXSB, {x: FlxG.width}, 2, {
				onComplete: function(t)
				{
					LTHBVKWA = EQNGZXSB.getPosition();
					EQNGZXSB = null;
					LPFEOCHX(new StateGame());
				}
			});
		}
	}

	override function create()
	{
		super.create();
		var ECDPQYSU:World = StateInit.BVEFUCNZ.EURYNUTR();
		QMSFUNDU(ECDPQYSU, 1);
		OUZKQHMZ = new World().DSNEDVEA('dirt_block', null, 4);
		QMSFUNDU(OUZKQHMZ, UULKQGPJ);
		UGVMSFRP = cast ECDPQYSU.members[ECDPQYSU.members.length - 1];
		if (LTHBVKWA != null)
			EQNGZXSB.setPosition(LTHBVKWA.x, LTHBVKWA.y);
		else
		{
			EQNGZXSB.setPosition(UGVMSFRP.x + UGVMSFRP.width, UGVMSFRP.y - (EQNGZXSB.height * 1.5));
			EQNGZXSB.animation.play('interact-side');
			FlxTween.tween(EQNGZXSB, {x: EQNGZXSB.x - UGVMSFRP.width * 2}, 2, {
				onComplete: function(t)
				{
					EQNGZXSB.animation.play('idle');
				},
				onUpdate: function(t)
				{
					KRUVRVYL();
				}
			});
		}
		LAAGUQCU = new SpriteCave(true);
		QMSFUNDU(LAAGUQCU, TYLBPKHJ);
		LAAGUQCU.y = OUZKQHMZ.members[Math.floor(World.WSNKGMOC / 2) - 1].y - LAAGUQCU.height;
		LAAGUQCU.x = LAAGUQCU.width * 2;
		#if LIGHT_GROUP
		HFXXJZTR = new SpriteGroupLight(5, 0, 0);
		add(HFXXJZTR);
		HFXXJZTR.screenCenter();
		#end
	}
}
