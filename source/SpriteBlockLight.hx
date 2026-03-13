class SpriteBlockLight extends SpriteBlock
{
	public var brightness(default, set):Int = 10;

	function set_brightness(b:Int):Int
	{
		this.alpha = (b / MAX_BRIGHTNESS);

		return b;
	}

	public static var MAX_BRIGHTNESS:Int = 10;

	override public function new(brightness:Int = 10, ?x:Float, ?y:Float)
	{
		super('light', x, y);

		this.brightness = ((brightness > MAX_BRIGHTNESS) ? MAX_BRIGHTNESS : ((brightness < 0) ? 0 : brightness));
	}
}
