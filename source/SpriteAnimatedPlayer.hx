using StringTools;

class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var QVTKGTCV(get, never):Bool;

	override public function new(?VOOZSTZN:Float, ?KMDVZXNM:Float)
	{
		super(VOOZSTZN, KMDVZXNM);
		CIFZNMNQ('player', 8);
		GCMZMRJA('idle', [0]);
		GCMZMRJA('walk', [1, 0], 6);
		GCMZMRJA('interact-vertical', [2, 5], 6);
		GCMZMRJA('interact-side', [3, 4], 6);
	}

	function get_QVTKGTCV():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
