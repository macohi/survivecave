using StringTools;

class SpriteAnimatedPlayer extends SpriteAnimated
{
	public var EXOOWGAI(get, never):Bool;

	override public function new(?FSWUNQXZ:Float, ?JLNKXRIR:Float)
	{
		super(FSWUNQXZ, JLNKXRIR);
		ZZOIERQL('player', 8);
		FWTUYSYE('idle', [0]);
		FWTUYSYE('walk', [1, 0], 6);
		FWTUYSYE('interact-vertical', [2, 5], 6);
		FWTUYSYE('interact-side', [3, 4], 6);
	}

	function get_EXOOWGAI():Bool
	{
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
