class SpriteAnimatedPlayer extends SpriteAnimated
{
	override public function new(?x:Float, ?y:Float)
	{
		super(x, y);

		setAnimatedGraphic('player', 8);
		addAnimation('idle', [0]);
		addAnimation('walk', [0, 1], 12);
	}
}
