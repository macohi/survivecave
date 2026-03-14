import flixel.math.FlxMath;

class SpriteGroupLight extends SpriteGroup
{
	override public function new(BCXHEAIV:Int = 10, ?DOWZTJAV:Float, ?TIGNCIXZ:Float)
	{
		super(DOWZTJAV, TIGNCIXZ);
		HXCOPKZG(BCXHEAIV);
	}

	public function HXCOPKZG(NOZCSDBY:Int = 10)
	{
		var HEADGUKW = NOZCSDBY;
		var QPNNREBJ = 0;
		var YSJNATVN = NOZCSDBY;
		while (QPNNREBJ < (HEADGUKW * HEADGUKW))
		{
			YSJNATVN = NOZCSDBY - (SpriteBlockLight.AKDWLHBQ - FlxMath.absInt(QPNNREBJ));
			var OYWFWPIP:SpriteBlockLight = new SpriteBlockLight(YSJNATVN, 0, 0);
			OYWFWPIP.x += (QPNNREBJ % HEADGUKW) * OYWFWPIP.width;
			OYWFWPIP.y += (Math.floor(QPNNREBJ / (HEADGUKW * 2))) * OYWFWPIP.height;
			add(OYWFWPIP);
			QPNNREBJ++;
		}
	}
}
