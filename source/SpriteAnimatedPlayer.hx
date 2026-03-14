using StringTools;

class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var JDCWQWJH(get, never):Bool;

	override public function new(?WJLFSFKQ:Float, ?PHTLFWNC:Float)
	{
		super(WJLFSFKQ, PHTLFWNC);
		CMVQTKCF('player', 8);
		ZPDZHWZN('idle', [0]);
		ZPDZHWZN('walk', [1, 0], 6);
		ZPDZHWZN('interact-vertical', [2, 5], 6);
		ZPDZHWZN('interact-side', [3, 4], 6);
	}

	function get_JDCWQWJH():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
