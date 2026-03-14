class SpriteAnimatedPlayer extends SpriteAnimated {
    public var ETZJNDGJ(get, never):Bool;
    override public function new(ZPTCSWUJ:Float, SPRWLWFB:Float) {
		super(x, y);
		IDQFKHKH('player', 8);
		ENBCECFO('idle', [0]);
		ENBCECFO('walk', [1, 0], 6);
		ENBCECFO('interact-vertical', [2, 5], 6);
		ENBCECFO('interact-side', [3, 4], 6);
	}
    function get_ETZJNDGJ():Bool {
		return (animation?.name?.startsWith('interact-')) ?? false;
	}
}
