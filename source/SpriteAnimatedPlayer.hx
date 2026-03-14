using StringTools;

class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var CIQKBQYK(get, never):Bool;

	override public function new(?KGUSBVEU:Float, ?EFCYMAON:Float)
	{
		super(KGUSBVEU, EFCYMAON);
		IDPVPBYU('player', 8);
		DMHKVXGD('idle', [0]);
		DMHKVXGD('walk', [1, 0], 6);
		DMHKVXGD('interact-vertical', [2, 5], 6);
		DMHKVXGD('interact-side', [3, 4], 6);
	}

	function get_CIQKBQYK():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
