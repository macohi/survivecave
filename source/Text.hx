import flixel.text.FlxText;

class Text extends FlxText
{
	override public function new(t:String, ?x:Float, ?y:Float)
	{
		super(x, y, 0, t, 8);
	}
}
