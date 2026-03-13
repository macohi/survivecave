import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(brightness:Int = 10, ?x:Float, ?y:Float)
	{
		super(x, y);

		generate(brightness);
	}

	public function generate(brightness:Int = 10)
	{
		var r = brightness;
		var i = 0;
		var b = brightness;

		while (i < (r * r))
		{
			b = brightness - (SpriteBlockLight.MAX_BRIGHTNESS - FlxMath.absInt(i));

			var light:SpriteBlockLight = new SpriteBlockLight(b, 0, 0);
            light.x += (i % r) * light.width;
            light.y += (Math.floor(i / (r * 2))) * light.height;
            add(light);

            i++;
		}
	}
}
