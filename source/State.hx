import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var XYZNWPBA:Array<FlxTypedContainer<FlxBasic>> = [];

	var RCLNZCFJ:Null<Int> = null;

	public function RVESNMLT(JVCVYGNO:FlxBasic, ?JOMSUGBK:Null<Int>)
	{
		if (JVCVYGNO == null)
		{
			trace('Adding null FlxBasic object unsupported.');
			return;
		}
		if (JOMSUGBK == null)
		{
			if (RCLNZCFJ == null)
			{
				RCLNZCFJ = 0;
			}
			JOMSUGBK = RCLNZCFJ + 1;
		}
		else
		{
			RCLNZCFJ = JOMSUGBK;
		}
		if (XYZNWPBA == null)
		{
			trace('"layers" variable uninitalized or destroyed. Reinitalizing...');
			XYZNWPBA = [];
		}
		while (XYZNWPBA.length < JOMSUGBK)
		{
			final LUWPMYWK = new FlxTypedContainer<FlxBasic>();
			LUWPMYWK.ID = XYZNWPBA.length;
			XYZNWPBA.push(LUWPMYWK);
			add(LUWPMYWK);
		}
		WLFSHLLP(JVCVYGNO, JOMSUGBK);
	}

	public function WLFSHLLP(KOQHXYVI:FlxBasic, LVYXSSDN:Null<Int>)
	{
		if (KOQHXYVI == null)
		{
			trace('A non-null FlxBasic object required.');
			return;
		}
		if (LVYXSSDN == null)
		{
			trace('A proper layer required.');
			return;
		}
		if (LVYXSSDN > XYZNWPBA.length || XYZNWPBA[LVYXSSDN - 1] == null)
		{
			trace('Cannot switch to non-existant layer');
			return;
		}
		for (LVYXSSDN in XYZNWPBA)
		{
			if (LVYXSSDN.members.contains(KOQHXYVI))
				LVYXSSDN.remove(KOQHXYVI);
		}
		XYZNWPBA[LVYXSSDN - 1].add(KOQHXYVI);
	}

	public function BIGODLMT(OWWXCEML:State)
	{
		FlxG.BIGODLMT(() -> OWWXCEML);
	}
}
