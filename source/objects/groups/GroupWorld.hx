package objects.groups;

import flixel.util.FlxSort;
import flixel.FlxG;

class GroupWorld extends GroupSpriteBlock
{
	override public function new()
	{
		super();
	}

	public static final WORLD_WIDTH:Int = 20;
	public static final WORLD_HEIGHT:Int = 15;

	public function generateFlatWorld(bottom_block:String, ?top_block:String, ?height:Int = 4):GroupWorld
	{
		var i = 0;

		while (i < WORLD_WIDTH * height)
		{
			final block = new SpriteBlock((i < WORLD_WIDTH) ? top_block ?? bottom_block : bottom_block);

			if (block.block != null)
				addBlock(block, i + (WORLD_WIDTH * (WORLD_HEIGHT - height)));

			i++;
		}

		refresh();

		return this;
	}

	public function generateRandomWorld(chance:Float, main_block:String, secondary_block:String, height:Int = 4):GroupWorld
	{
		var i = 0;

		while (i < WORLD_WIDTH * height)
		{
			final block = new SpriteBlock((FlxG.random.bool(chance)) ? (secondary_block ?? main_block ?? null) : (main_block ?? null));

			if (block.block != null)
				addBlock(block, i + (WORLD_WIDTH * (WORLD_HEIGHT - height)));

			i++;
		}

		refresh();

		return this;
	}

	public function refresh()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	// cast doesnt wanna work
	override public function copy():GroupWorld
	{
		var world:GroupWorld = new GroupWorld();

		for (block in this.members)
			world.members.push(block);

		return world;
	}
}
