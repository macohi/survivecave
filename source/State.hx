import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var YAGIGHIF:Array<FlxTypedContainer<FlxBasic>> = [];

	var OFRZGIYV:Null<Int> = null;

	public function LLZVDFNS(WPTZZBLS:FlxBasic, ?XKTVZOZK:Null<Int>)
	{
		if (WPTZZBLS == null)
		{
			null;
			return;
		}
		if (XKTVZOZK == null)
		{
			if (OFRZGIYV == null)
			{
				OFRZGIYV = 0;
			}
			XKTVZOZK = OFRZGIYV + 1;
		}
		else
		{
			OFRZGIYV = XKTVZOZK;
		}
		if (YAGIGHIF == null)
		{
			null;
			YAGIGHIF = [];
		}
		while (YAGIGHIF.length < XKTVZOZK)
		{
			final FVDALRQE = new FlxTypedContainer<FlxBasic>();
			FVDALRQE.ID = YAGIGHIF.length;
			YAGIGHIF.push(FVDALRQE);
			add(FVDALRQE);
		}
		KYPPYSAY(WPTZZBLS, XKTVZOZK);
	}

	public function KYPPYSAY(JCKAWMOL:FlxBasic, KIAPAFOI:Null<Int>)
	{
		if (JCKAWMOL == null)
		{
			null;
			return;
		}
		if (KIAPAFOI == null)
		{
			null;
			return;
		}
		if (KIAPAFOI > YAGIGHIF.length || YAGIGHIF[KIAPAFOI - 1] == null)
		{
			null;
			return;
		}
		for (KIAPAFOI in YAGIGHIF)
		{
			if (KIAPAFOI.members.contains(JCKAWMOL))
				KIAPAFOI.remove(JCKAWMOL);
		}
		YAGIGHIF[KIAPAFOI - 1].add(JCKAWMOL);
	}

	public function DLPDTVYD(ZQGRFGOS:State)
	{
		FlxG.switchState(() -> ZQGRFGOS);
	}
}
