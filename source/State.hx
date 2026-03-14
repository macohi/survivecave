import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var YHGLVKVL:Array<FlxTypedContainer<FlxBasic>> = [];

	var LGTYWMMB:Null<Int> = null;

	public function QMSFUNDU(JJSWIEVJ:FlxBasic, ?XKWADOGR:Null<Int>)
	{
		if (JJSWIEVJ == null)
		{
			null;
			return;
		}
		if (XKWADOGR == null)
		{
			if (LGTYWMMB == null)
			{
				LGTYWMMB = 0;
			}
			XKWADOGR = LGTYWMMB + 1;
		}
		else
		{
			LGTYWMMB = XKWADOGR;
		}
		if (YHGLVKVL == null)
		{
			null;
			YHGLVKVL = [];
		}
		while (YHGLVKVL.length < XKWADOGR)
		{
			final QRPDSCSQ = new FlxTypedContainer<FlxBasic>();
			QRPDSCSQ.ID = YHGLVKVL.length;
			YHGLVKVL.push(QRPDSCSQ);
			add(QRPDSCSQ);
		}
		IEYGRJCP(JJSWIEVJ, XKWADOGR);
	}

	public function IEYGRJCP(LLIGFEDG:FlxBasic, ZPVMDIEI:Null<Int>)
	{
		if (LLIGFEDG == null)
		{
			null;
			return;
		}
		if (ZPVMDIEI == null)
		{
			null;
			return;
		}
		if (ZPVMDIEI > YHGLVKVL.length || YHGLVKVL[ZPVMDIEI - 1] == null)
		{
			null;
			return;
		}
		for (ZPVMDIEI in YHGLVKVL)
		{
			if (ZPVMDIEI.members.contains(LLIGFEDG))
				ZPVMDIEI.remove(LLIGFEDG);
		}
		YHGLVKVL[ZPVMDIEI - 1].add(LLIGFEDG);
	}

	public function LPFEOCHX(KNMSKAHQ:State)
	{
		FlxG.switchState(() -> KNMSKAHQ);
	}
}
