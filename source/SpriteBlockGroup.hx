import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function kdke():SpriteBlockGroup
	{
		var ddda:SpriteBlockGroup = new SpriteBlockGroup();
		for (edke in this.members)
			ddda.members.push(edke);
		return ddda;
	}

	public function adkd(dkke:SpriteBlock, kaad:Int)
	{
		dkke.ID = kaad;
		dkke.setPosition((kaad % World.keaa) * dkke.width, Math.floor(kaad / World.keaa) * dkke.height);
		if (dkke.eddk != null)
			add(dkke);
	}
}
