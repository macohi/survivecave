import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(ekea:Int = 10, ?ddek:Float, ?kdka:Float)
	{
		super(ddek, kdka);
		aded(ekea);
	}

	public function aded(kkdd:Int = 10)
	{
		var edek:Int = kkdd;
		var ekaa:Int = 0;
		var kdkk:Int = kkdd;
		while (ekaa < (edek * edek))
		{
			kdkk = kkdd - (SpriteBlockLight.ddak - FlxMath.absInt(ekaa));
			var dead:SpriteBlockLight = new SpriteBlockLight(kdkk, 0, 0);
			dead.x += (ekaa % edek) * dead.width;
			dead.y += (Math.floor(ekaa / (edek * 2))) * dead.height;
			add(dead);
			ekaa++;
		}
	}
}
