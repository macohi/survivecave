import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var IOYTZWMZ:Array<String> = [];
	public final WROGJTPW:Int = 14;
	public var XRTWNUUG:TextGroup;
	public var UISCMSDE:TextGroup;
	public var ODKWNQSL:Int = 0;
	public var AVQGWODF:Bool = true;
	public var RYDEDOQH:Int = 0;
	public var MUADIFHL:Int = 0;

	var FGUKBYOT = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var WKMSEDTG = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var TUDIMMBI = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		ZHGAYTMS();
		TYLUEOVN();
		final VKCMYSBV = Global.YHYNZIHV.PQYDPGRN;
		trace(VKCMYSBV);
		for (inventoryItem in Global.KFNWIXZL.VJJXCPTH)
		{
			var CCYXYPTB:Bool = false;
			for (i => ingredientGroups in inventoryItem.ONSJHLYO)
			{
				if (CCYXYPTB)
					continue;
				var KUWIXGKT = 0;
				var JFKPTRTA = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					KUWIXGKT++;
					if (VKCMYSBV.exists(itemId))
						if (VKCMYSBV.get(itemId) >= itemStack)
							JFKPTRTA++;
					if (JFKPTRTA < KUWIXGKT)
					{
						CCYXYPTB = true;
						IOYTZWMZ.push(inventoryItem.JSGOPJQE.USCWGZYR);
						trace('${inventoryItem.JSGOPJQE.LRMXYGLH} : ${inventoryItem.ONSJHLYO[i]}');
					}
				}
			}
		}
	}

	override function update(WFCJJHPC:Float)
	{
		super.update(WFCJJHPC);
		BUVNLFJV();
		ESZYNWKP();
	}

	public function BUVNLFJV()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.HWUKCMXE == 2)
				SUEEHYDO(new StateCave());
			else
				SUEEHYDO(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			ODKWNQSL--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			ODKWNQSL++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				MUADIFHL--;
			else
				RYDEDOQH--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				MUADIFHL++;
			else
				RYDEDOQH++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			ODKWNQSL = 0;
			AVQGWODF = !AVQGWODF;
		}
		if (ODKWNQSL < 0)
		{
			ODKWNQSL = WROGJTPW;
			if (AVQGWODF)
				RYDEDOQH--;
			else
				MUADIFHL--;
		}
		if (ODKWNQSL > WROGJTPW)
		{
			ODKWNQSL = 0;
			if (AVQGWODF)
				RYDEDOQH++;
			else
				MUADIFHL++;
		}
		if (ODKWNQSL > Global.YHYNZIHV.VJJXCPTH.length - 1)
			ODKWNQSL = 0;
		if (RYDEDOQH < 0)
			RYDEDOQH = Global.YHYNZIHV.VJJXCPTH.length - ((WROGJTPW * 1) + 1);
		if (RYDEDOQH > Global.YHYNZIHV.VJJXCPTH.length - ((WROGJTPW * 1) + 1))
			RYDEDOQH = 0;
		if (MUADIFHL < 0)
			MUADIFHL = Global.KFNWIXZL.VJJXCPTH.length - ((WROGJTPW * 1) + 1);
		if (MUADIFHL > Global.KFNWIXZL.VJJXCPTH.length - ((WROGJTPW * 1) + 1))
			MUADIFHL = 0;
		FlxG.watch.addQuick('curSelect', ODKWNQSL);
		FlxG.watch.addQuick('inventoryOffset', RYDEDOQH);
		FlxG.watch.addQuick('itemListOffset', MUADIFHL);
	}

	public function TYLUEOVN()
	{
		XRTWNUUG = new TextGroup(WKMSEDTG.x, WKMSEDTG.y);
		UISCMSDE = new TextGroup(TUDIMMBI.x, TUDIMMBI.y);
		add(XRTWNUUG);
		add(UISCMSDE);
		final QIODTSZU = 32;
		for (i => item in Global.KFNWIXZL.VJJXCPTH)
		{
			if (i > WROGJTPW)
				continue;
			var KPPKCZAG:TextInventoryItem = new TextInventoryItem(item, 0, i * QIODTSZU);
			KPPKCZAG.ID = i;
			UISCMSDE.add(KPPKCZAG);
		}
		for (i => item in Global.YHYNZIHV.VJJXCPTH)
		{
			if (i > WROGJTPW)
				continue;
			var KPPKCZAG:TextInventoryItem = new TextInventoryItem(item, 0, i * QIODTSZU);
			KPPKCZAG.ID = i;
			XRTWNUUG.add(KPPKCZAG);
		}
	}

	public function ESZYNWKP()
	{
		for (text in UISCMSDE.members)
		{
			var GDHLZPFF:TextInventoryItem = cast text;
			GDHLZPFF.color = FlxColor.WHITE;
			if (ODKWNQSL == GDHLZPFF.ID && !AVQGWODF)
				GDHLZPFF.color = FlxColor.YELLOW;
			final VMYAOMRP = Global.KFNWIXZL.VJJXCPTH[GDHLZPFF.ID + MUADIFHL];
			if (IOYTZWMZ.contains(VMYAOMRP.JSGOPJQE.USCWGZYR))
				GDHLZPFF.setColorTransform(0.75, 0.75, 0.75);
			else
				GDHLZPFF.setColorTransform(1.00, 1.00, 1.00);
			GDHLZPFF.text = GDHLZPFF.UIYYMMWQ(VMYAOMRP, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$itemListOffset)' #else '' #end;
		}
		for (text in XRTWNUUG.members)
		{
			var GDHLZPFF:TextInventoryItem = cast text;
			GDHLZPFF.color = FlxColor.WHITE;
			if (ODKWNQSL == GDHLZPFF.ID && AVQGWODF)
				GDHLZPFF.color = FlxColor.YELLOW;
			GDHLZPFF.text = GDHLZPFF.UIYYMMWQ(Global.YHYNZIHV.VJJXCPTH[GDHLZPFF.ID + RYDEDOQH], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$inventoryOffset)' #else '' #end;
		}
	}

	public function ZHGAYTMS()
	{
		FGUKBYOT.scale.set(FlxG.width / 2, FlxG.height / 2);
		WKMSEDTG.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		TUDIMMBI.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		FGUKBYOT.updateHitbox();
		WKMSEDTG.updateHitbox();
		TUDIMMBI.updateHitbox();
		FGUKBYOT.screenCenter();
		WKMSEDTG.screenCenter();
		TUDIMMBI.screenCenter();
		TUDIMMBI.y = WKMSEDTG.y += 3;
		WKMSEDTG.x = 10;
		TUDIMMBI.x = FlxG.width - TUDIMMBI.width - 10;
		GWBTGWNX(FGUKBYOT, 1);
		GWBTGWNX(WKMSEDTG);
		GWBTGWNX(TUDIMMBI);
	}
}
