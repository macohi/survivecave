using StringTools;

class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var VFXDBSQU(get, never):Bool;

	override public function new(?RMUSWHKD:Float, ?AGKXNAZF:Float)
	{
		super(RMUSWHKD, AGKXNAZF);
		XYFFXYQP('player', 8);
		QKQHUXJF('idle', [0]);
		QKQHUXJF('walk', [1, 0], 6);
		QKQHUXJF('interact-vertical', [2, 5], 6);
		QKQHUXJF('interact-side', [3, 4], 6);
	}

	function get_VFXDBSQU():Bool
	{
		return (animation?.NXSIDOIG?.startsWith('interact-')) ?? false;
	}
}
