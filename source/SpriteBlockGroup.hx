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

		block.setPosition((index % World.WORLD_WIDTH) * block.width, Math.floor(index / World.WORLD_WIDTH) * block.height);
		if (block.block != null)
			add(block);
	}
}
