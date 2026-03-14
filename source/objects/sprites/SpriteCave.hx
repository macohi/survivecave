package objects.sprites;

class SpriteCave extends Sprite
{
	override public function new(incave:Bool = false, ?x:Float, ?y:Float)
	{
		super('cave' + (incave ? '-cave' : ''), x, y);
	}
}
