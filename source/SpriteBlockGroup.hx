import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function copy():SpriteBlockGroup
	{
		var sprGrp:SpriteBlockGroup = new SpriteBlockGroup();

		for (sprite in this.members)
			sprGrp.members.push(sprite);

		return sprGrp;
	}

	public function addBlock(block:SpriteBlock, index:Int)
	{
		block.ID = index;

		block.setPosition((index % World.UNXNIRGX) * block.width, Math.floor(index / World.UNXNIRGX) * block.height);
		if (block.ROZPBERV != null)
			add(block);
	}
}
