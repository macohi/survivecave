import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteGroup extends FlxTypedSpriteGroup<Sprite>
{
	public function KROTSRJD():SpriteGroup
	{
		var KAELMEXF:SpriteGroup = new SpriteGroup();
		for (TCHRPPUS in this.members)
			KAELMEXF.members.push(TCHRPPUS);
		return KAELMEXF;
	}
}
