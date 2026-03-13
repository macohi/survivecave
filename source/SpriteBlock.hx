class SpriteBlock extends Sprite
{
	override public function new(block:String, ?x:Float, ?y:Float)
	{
		super('blocks/$block', x, y);
	}
}
