class SpriteItem extends Sprite
{
	override public function new(item:String, ?x:Float, ?y:Float)
	{
		super('items/$item', x, y);
	}
}
