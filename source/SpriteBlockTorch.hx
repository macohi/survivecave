class SpriteBlockTorch extends SpriteBlock
{
    public var brightness:Int = 15;

	override public function new(brightness:Int = 15, ?x:Float, ?y:Float)
	{
		super('torch', x, y);

        this.brightness = brightness;
	}
}
