import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var eeea:Array<FlxTypedContainer<FlxBasic>> = [];

	var kkde:Null<Int> = null;

	public function akad(aaea:FlxBasic, ?dkdk:Null<Int>)
	{
		if (aaea == null)
		{
			null;
			return;
		}
		if (dkdk == null)
		{
			if (kkde == null)
			{
				kkde = 0;
			}
			dkdk = kkde + 1;
		}
		else
		{
			kkde = dkdk;
		}
		if (eeea == null)
		{
			null;
			eeea = [];
		}
		while (eeea.length < dkdk)
		{
			final kedd:FlxTypedContainer<FlxBasic> = new FlxTypedContainer<FlxBasic>();
			kedd.ID = eeea.length;
			eeea.push(kedd);
			add(kedd);
		}
		aakk(aaea, dkdk);
	}

	public function aakk(eaek:FlxBasic, aked:Null<Int>)
	{
		if (eaek == null)
		{
			null;
			return;
		}
		if (aked == null)
		{
			null;
			return;
		}
		if (aked > eeea.length || eeea[aked - 1] == null)
		{
			null;
			return;
		}
		for (aked in eeea)
		{
			if (aked.members.contains(eaek))
				aked.remove(eaek);
		}
		eeea[aked - 1].add(eaek);
	}

	public function eedk(kdee:State)
	{
		FlxG.switchState(() -> kdee);
	}
}
