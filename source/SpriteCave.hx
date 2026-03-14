class SpriteCave extends Sprite
{
	override public function new(eade:Bool = false, ?ddka:Float, ?kede:Float)
	{
		super('cave' + (eade ? '-cave' : ''), ddka, kede);
	}
}
