package objects.sprites;

class SpriteGUI extends Sprite
{
	override public function new(gui:String, ?x:Float, ?y:Float)
	{
		super((gui == null) ? null : 'gui/$gui', x, y);

		setScaleSingle(1);
	}
}
