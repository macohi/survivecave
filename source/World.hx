import flixel.FlxG;
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

    public function generateFlatWorld(bottom_block:String, ?top_block:String, ?height:Int = 4):World
    {
        var i = 0;

        while (i < WORLD_WIDTH * height)
        {
            final block = new SpriteBlock((i < WORLD_WIDTH) ? top_block ?? bottom_block : bottom_block);

            addBlock(block, i + (WORLD_WIDTH * (WORLD_HEIGHT - height)));

            i++;
        }

        return this;
    }

    public function generateRandomWorld(chance:Float, main_block:String, secondary_block:String, height:Int = 4):World
    {
        var i = 0;

        while (i < WORLD_WIDTH * height)
        {
            final block = new SpriteBlock((FlxG.random.bool(chance)) ? secondary_block ?? main_block : main_block);

            addBlock(block, i + (WORLD_WIDTH * (WORLD_HEIGHT - height)));

            i++;
        }

        return this;
    }
}
