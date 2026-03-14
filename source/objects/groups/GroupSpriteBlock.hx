package objects.groups;

import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class GroupSpriteBlock extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function copy():GroupSpriteBlock
	{
		var sprGrp:GroupSpriteBlock = new GroupSpriteBlock();

		for (sprite in this.members)
			sprGrp.members.push(sprite);

		return sprGrp;
	}

	public function addBlock(block:SpriteBlock, index:Int)
	{
		block.ID = index;

		block.setPosition((index % GroupWorld.WORLD_WIDTH) * block.width, Math.floor(index / GroupWorld.WORLD_WIDTH) * block.height);
		if (block.block != null)
			add(block);
	}
}
