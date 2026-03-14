package objects.sprites;

using StringTools;

class SpritePlayer extends Sprite
{
	override public function new(?x:Float, ?y:Float)
	{
		super(null, x, y);

		setAnimatedGraphic('player', 8);
		addAnimation('idle', [0]);
		addAnimation('walk', [1, 0], 6);
		addAnimation('interact-vertical', [2, 5], 6);
		addAnimation('interact-side', [3, 4], 6);
	}

	public var interacting(get, never):Bool;

	function get_interacting():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
