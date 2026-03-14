class SpriteBlock extends Sprite
{
	public var eddk:String = '';
	public var eaaa:Bool = true;

	override public function new(kaee:String, ?aeak:Float, ?deea:Float)
	{
		this.eddk = kaee;
		super((kaee == null) ? null : 'blocks/$kaee', aeak, deea);
	}
}
