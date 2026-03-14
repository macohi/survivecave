import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteGroup extends FlxTypedSpriteGroup<Sprite>
{
	public function copy():SpriteGroup
	{
		var sprGrp:SpriteGroup = new SpriteGroup();

		for (sprite in this.members)
			sprGrp.members.push(sprite);

		return sprGrp;
	}
}
