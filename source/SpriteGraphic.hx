import flixel.util.FlxColor;

class SpriteGraphic extends Sprite
{
	override public function new(dkkk:Int, eeaa:Int, ?kkda:FlxColor = FlxColor.WHITE, ?addk:Float, ?kead:Float)
	{
		super(null, addk, kead);
		makeGraphic(dkkk, eeaa, kkda);
	}
}
