class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var NYOCCKBA(get, never):Bool;

	override public function new(?NQVNGSFG:Float, ?YOBVZCQQ:Float)
	{
		super(NQVNGSFG, YOBVZCQQ);
		ROXCKAWC('player', 8);
		QAYODEGE('idle', [0]);
		QAYODEGE('walk', [1, 0], 6);
		QAYODEGE('interact-vertical', [2, 5], 6);
		QAYODEGE('interact-side', [3, 4], 6);
	}

	function get_NYOCCKBA():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
