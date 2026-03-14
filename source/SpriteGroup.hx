import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteGroup extends FlxTypedSpriteGroup<Sprite>
{
	public function ekka():SpriteGroup
	{
		var aaad:SpriteGroup = new SpriteGroup();
		for (dkee in this.members)
			aaad.members.push(dkee);
		return aaad;
	}
}
