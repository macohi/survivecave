import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var ALYYAXBH:Array<FlxTypedContainer<FlxBasic>> = [];

	var ONFHCTXH:Null<Int> = null;

	public function GWBTGWNX(QMYGOKXF:FlxBasic, ?JYTFPHFP:Null<Int>)
	{
		if (QMYGOKXF == null)
		{
			trace('Adding null FlxBasic object unsupported.');
			return;
		}
		if (JYTFPHFP == null)
		{
			if (ONFHCTXH == null)
			{
				ONFHCTXH = 0;
			}
			JYTFPHFP = ONFHCTXH + 1;
		}
		else
		{
			ONFHCTXH = JYTFPHFP;
		}
		if (ALYYAXBH == null)
		{
			trace('"layers" variable uninitalized or destroyed. Reinitalizing...');
			ALYYAXBH = [];
		}
		while (ALYYAXBH.length < JYTFPHFP)
		{
			final CIAGZXQM = new FlxTypedContainer<FlxBasic>();
			CIAGZXQM.ID = ALYYAXBH.length;
			ALYYAXBH.push(CIAGZXQM);
			add(CIAGZXQM);
		}
		SYUTTAOP(QMYGOKXF, JYTFPHFP);
	}

	public function SYUTTAOP(MAJSRMLC:FlxBasic, ZNZPAMWZ:Null<Int>)
	{
		if (MAJSRMLC == null)
		{
			trace('A non-null FlxBasic object required.');
			return;
		}
		if (ZNZPAMWZ == null)
		{
			trace('A proper layer required.');
			return;
		}
		if (ZNZPAMWZ > ALYYAXBH.length || ALYYAXBH[ZNZPAMWZ - 1] == null)
		{
			trace('Cannot switch to non-existant layer');
			return;
		}
		for (ZNZPAMWZ in ALYYAXBH)
		{
			if (ZNZPAMWZ.members.contains(MAJSRMLC))
				ZNZPAMWZ.remove(MAJSRMLC);
		}
		ALYYAXBH[ZNZPAMWZ - 1].add(MAJSRMLC);
	}

	public function SUEEHYDO(QCFPMOPH:State)
	{
		FlxG.switchState(() -> QCFPMOPH);
	}
}
