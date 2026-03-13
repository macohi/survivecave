class SpriteBlock extends Sprite
{
	override public function new(block:String, ?x:Float, ?y:Float)
	{
		super((block == null) ? null : 'blocks/$block', x, y);
	}
}
