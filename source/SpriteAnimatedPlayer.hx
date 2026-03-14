using StringTools;

class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var aaaa(get, never):Bool;

	override public function new(?kdea:Float, ?keae:Float)
	{
		super(kdea, keae);
		kdaa('player', 8);
		deke('idle', [0]);
		deke('walk', [1, 0], 6);
		deke('interact-vertical', [2, 5], 6);
		deke('interact-side', [3, 4], 6);
	}

	function get_aaaa():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
