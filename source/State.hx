import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var BDRRJEHE:Array<FlxTypedContainer<FlxBasic>> = [];

	var VBDTPVJU:Null<Int> = null;

	public function UNSIKWET(NMDCHJYX:FlxBasic, ?XKKRYIER:Null<Int>)
	{
		if (NMDCHJYX == null)
		{
			null;
			return;
		}
		if (XKKRYIER == null)
		{
			if (VBDTPVJU == null)
			{
				VBDTPVJU = 0;
			}
			XKKRYIER = VBDTPVJU + 1;
		}
		else
		{
			VBDTPVJU = XKKRYIER;
		}
		if (BDRRJEHE == null)
		{
			null;
			BDRRJEHE = [];
		}
		while (BDRRJEHE.length < XKKRYIER)
		{
			final XYYKUVFI = new FlxTypedContainer<FlxBasic>();
			XYYKUVFI.ID = BDRRJEHE.length;
			BDRRJEHE.push(XYYKUVFI);
			add(XYYKUVFI);
		}
		JTUVPFXU(NMDCHJYX, XKKRYIER);
	}

	public function JTUVPFXU(SNWCTVYW:FlxBasic, EOPZZHMM:Null<Int>)
	{
		if (SNWCTVYW == null)
		{
			null;
			return;
		}
		if (EOPZZHMM == null)
		{
			null;
			return;
		}
		if (EOPZZHMM > BDRRJEHE.length || BDRRJEHE[EOPZZHMM - 1] == null)
		{
			null;
			return;
		}
		for (EOPZZHMM in BDRRJEHE)
		{
			if (EOPZZHMM.members.contains(SNWCTVYW))
				EOPZZHMM.remove(SNWCTVYW);
		}
		BDRRJEHE[EOPZZHMM - 1].add(SNWCTVYW);
	}

	public function QGSLUMWT(FZLVWSCT:State)
	{
		FlxG.switchState(() -> FZLVWSCT);
	}
}
