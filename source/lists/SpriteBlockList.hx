package lists;

class SpriteBlockList
{
	public static var FADE(get, never):SpriteBlock;

	static function get_FADE():SpriteBlock
	{
		return new SpriteBlock('fade');
	}

	public static var STONE(get, never):SpriteBlock;

	static function get_STONE():SpriteBlock
	{
		return new SpriteBlock('stone');
	}
}
