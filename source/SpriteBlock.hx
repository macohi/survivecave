class SpriteBlock extends Sprite
{
	public var block:String = '';
	
	public var hasCollision:Bool = true;

	override public function new(block:String, ?x:Float, ?y:Float)
	{
		this.block = block;

		super((block == null) ? null : 'blocks/$block', x, y);
	}
}
