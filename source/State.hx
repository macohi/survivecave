import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var VKCELIUM:Array<FlxTypedContainer<FlxBasic>> = [];

	var XHJSPSLL:Null<Int> = null;

	public function SMIXXKUZ(BVYUCTEW:FlxBasic, ?YRZUPZSR:Null<Int>)
	{
		if (BVYUCTEW == null)
		{
			null;
			return;
		}
		if (YRZUPZSR == null)
		{
			if (XHJSPSLL == null)
			{
				XHJSPSLL = 0;
			}
			YRZUPZSR = XHJSPSLL + 1;
		}
		else
		{
			XHJSPSLL = YRZUPZSR;
		}
		if (VKCELIUM == null)
		{
			null;
			VKCELIUM = [];
		}
		while (VKCELIUM.length < YRZUPZSR)
		{
			final YDCCFKDA:FlxTypedContainer<FlxBasic> = new FlxTypedContainer<FlxBasic>();
			YDCCFKDA.ID = VKCELIUM.length;
			VKCELIUM.push(YDCCFKDA);
			add(YDCCFKDA);
		}
		DMHZLXCO(BVYUCTEW, YRZUPZSR);
	}

	public function DMHZLXCO(LLVTYHXJ:FlxBasic, KFGCLLGB:Null<Int>)
	{
		if (LLVTYHXJ == null)
		{
			null;
			return;
		}
		if (KFGCLLGB == null)
		{
			null;
			return;
		}
		if (KFGCLLGB > VKCELIUM.length || VKCELIUM[KFGCLLGB - 1] == null)
		{
			null;
			return;
		}
		for (KFGCLLGB in VKCELIUM)
		{
			if (KFGCLLGB.members.contains(LLVTYHXJ))
				KFGCLLGB.remove(LLVTYHXJ);
		}
		VKCELIUM[KFGCLLGB - 1].add(LLVTYHXJ);
	}

	public function LEFMGEJF(KSFSZKYP:State)
	{
		FlxG.switchState(() -> KSFSZKYP);
	}
}
