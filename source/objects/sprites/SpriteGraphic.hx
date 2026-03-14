package objects.sprites;

import flixel.util.FlxColor;

class SpriteGraphic extends Sprite
{
	override public function new(width:Int, height:Int, ?color:FlxColor = FlxColor.WHITE, ?x:Float, ?y:Float)
	{
		super(null, x, y);

		makeGraphic(width, height, color);
	}
}
