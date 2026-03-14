import flixel.util.FlxSort;
import flixel.FlxG;

class World extends SpriteBlockGroup
{
	public static final YVKKUTND:Int = 20;
	public static final XDFGHLXG:Int = 15;

	override public function new()
	{
		super();
	}

	public function QRKBWOUL(NNBETNDK:String, ?LFMYEKCU:String, ?FOYVYNWG:Int = 4):World
	{
		var XAOGQDYQ = 0;
		while (XAOGQDYQ < YVKKUTND * FOYVYNWG)
		{
			final FIHGLGAX = new SpriteBlock((XAOGQDYQ < YVKKUTND) ? LFMYEKCU ?? NNBETNDK : NNBETNDK);
			if (FIHGLGAX.SCAABKJF != null)
				UAFBFSAC(FIHGLGAX, XAOGQDYQ + (YVKKUTND * (XDFGHLXG - FOYVYNWG)));
			XAOGQDYQ++;
		}
		AZPWNXKH();
		return this;
	}

	public function UFXSRZLF(VGLNYTTN:Float, YKXNNKEM:String, BPLHQYOF:String, HYPZCNGP:Int = 4):World
	{
		var ONVLVVFJ = 0;
		while (ONVLVVFJ < YVKKUTND * HYPZCNGP)
		{
			final VGQBSVKN = new SpriteBlock((FlxG.random.bool(VGLNYTTN)) ? (BPLHQYOF ?? YKXNNKEM ?? null) : (YKXNNKEM ?? null));
			if (VGQBSVKN.SCAABKJF != null)
				UAFBFSAC(VGQBSVKN, ONVLVVFJ + (YVKKUTND * (XDFGHLXG - HYPZCNGP)));
			ONVLVVFJ++;
		}
		AZPWNXKH();
		return this;
	}

	public function AZPWNXKH()
	{
		this.members.sort((sb1, sb2) -> FlxSort.byValues(FlxSort.ASCENDING, sb1.ID, sb2.ID));
	}

	override public function PFYBWXKS():World
	{
		var BIJNODMW:World = new World();
		for (UTSKYLWP in this.members)
			BIJNODMW.members.push(UTSKYLWP);
		return BIJNODMW;
	}
}
