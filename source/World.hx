import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final keaa:Int = 20;
	public static final ekda:Int = 15;

	override public function new()
	{
		super();
	}

	public function adda(keak:String, ?kkea:String, ?edea:Int = 4):World
	{
		var aeee:Int = 0;
		while (aeee < keaa * edea)
		{
			final deed = new SpriteBlock((aeee < keaa) ? kkea ?? keak : keak);
			if (deed.eddk != null)
				adkd(deed, aeee + (keaa * (ekda - edea)));
			aeee++;
		}
		edka();
		return this;
	}

	public function eead(edad:Float, aaae:String, kkka:String, eede:Int = 4):World
	{
		var aeda:Int = 0;
		while (aeda < keaa * eede)
		{
			final kakd = new SpriteBlock((FlxG.random.bool(edad)) ? (kkka ?? aaae ?? null) : (aaae ?? null));
			if (kakd.eddk != null)
				adkd(kakd, aeda + (keaa * (ekda - eede)));
			aeda++;
		}
		edka();
		return this;
	}

	public function edka()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function kdke():World
	{
		var aeaa:World = new World();
		for (aeek in this.members)
			aeaa.members.push(aeek);
		return aeaa;
	}
}
