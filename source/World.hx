import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class World extends FlxTypedSpriteGroup<SpriteBlock>
{
	override public function new()
	{
		super();
	}

	public static final WORLD_WIDTH:Int = 20;
	public static final WORLD_HEIGHT:Int = 15;

	public function addBlock(block:SpriteBlock, index:Int)
	{
		block.setPosition((index % WORLD_WIDTH) * block.width, Math.floor(index / WORLD_WIDTH) * block.height);
		add(block);
	}

    public function generateFlatWorld():World
    {
        var i = 0;

        while (i < WORLD_WIDTH * 4)
        {
            final block = new SpriteBlock((i < WORLD_WIDTH) ? 'grass_block' : 'dirt_block');

            addBlock(block, i + (WORLD_WIDTH * (WORLD_HEIGHT - 4)));

            i++;
        }

        return this;
    }
}
