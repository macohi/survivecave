import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var JWBOBBGP:Array<String> = [];
	public final HRYWBXUC:Int = 14;
	public var PZIVYBDI:TextGroup;
	public var GUMBJBAF:TextGroup;
	public var UVNXOYNK:Int = 0;
	public var IFKCLSFY:Bool = true;
	public var TVSMRBFR:Int = 0;
	public var LXUVPJPS:Int = 0;

	var MBWTVFMM = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var VUUVIEOW = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var XGQSPUPI = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		AOFHEIYV();
		JOMZBZGP();
		final ZFUOPCOO = Global.CTWGXSEG.ingredientsMap;
		null;
		for (ESUGMDSQ in Global.MIXXABIZ.contents)
		{
			var OSTWMOBF:Bool = false;
			for (i => ingredientGroups in ESUGMDSQ.ingredientItems)
			{
				if (OSTWMOBF)
					continue;
				var LXYDLEAH = 0;
				var NWYVMGRS = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					LXYDLEAH++;
					if (ZFUOPCOO.exists(itemId))
						if (ZFUOPCOO.get(itemId) >= itemStack)
							NWYVMGRS++;
					if (NWYVMGRS < LXYDLEAH)
					{
						OSTWMOBF = true;
						JWBOBBGP.push(ESUGMDSQ.item.id);
						null;
					}
				}
			}
		}
	}

	override function update(RAOWOQZE:Float)
	{
		super.update(RAOWOQZE);
		CSTWYGQE();
		WURLIOGJ();
	}

	public function CSTWYGQE()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.XDUXVHZI == 2)
				DLPDTVYD(new StateCave());
			else
				DLPDTVYD(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			UVNXOYNK--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			UVNXOYNK++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				LXUVPJPS--;
			else
				TVSMRBFR--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				LXUVPJPS++;
			else
				TVSMRBFR++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			UVNXOYNK = 0;
			IFKCLSFY = !IFKCLSFY;
		}
		if (UVNXOYNK < 0)
		{
			UVNXOYNK = HRYWBXUC;
			if (IFKCLSFY)
				TVSMRBFR--;
			else
				LXUVPJPS--;
		}
		if (UVNXOYNK > HRYWBXUC)
		{
			UVNXOYNK = 0;
			if (IFKCLSFY)
				TVSMRBFR++;
			else
				LXUVPJPS++;
		}
		if (UVNXOYNK > Global.CTWGXSEG.contents.length - 1)
			UVNXOYNK = 0;
		if (TVSMRBFR < 0)
			TVSMRBFR = Global.CTWGXSEG.contents.length - ((HRYWBXUC * 1) + 1);
		if (TVSMRBFR > Global.CTWGXSEG.contents.length - ((HRYWBXUC * 1) + 1))
			TVSMRBFR = 0;
		if (LXUVPJPS < 0)
			LXUVPJPS = Global.MIXXABIZ.contents.length - ((HRYWBXUC * 1) + 1);
		if (LXUVPJPS > Global.MIXXABIZ.contents.length - ((HRYWBXUC * 1) + 1))
			LXUVPJPS = 0;
		FlxG.watch.addQuick('curSelect', UVNXOYNK);
		FlxG.watch.addQuick('inventoryOffset', TVSMRBFR);
		FlxG.watch.addQuick('itemListOffset', LXUVPJPS);
	}

	public function JOMZBZGP()
	{
		PZIVYBDI = new TextGroup(VUUVIEOW.x, VUUVIEOW.y);
		GUMBJBAF = new TextGroup(XGQSPUPI.x, XGQSPUPI.y);
		add(PZIVYBDI);
		add(GUMBJBAF);
		final UZJAPHXG = 32;
		for (i => item in Global.MIXXABIZ.contents)
		{
			if (i > HRYWBXUC)
				continue;
			var VWMSDVHT:TextInventoryItem = new TextInventoryItem(item, 0, i * UZJAPHXG);
			VWMSDVHT.ID = i;
			GUMBJBAF.add(VWMSDVHT);
		}
		for (i => item in Global.CTWGXSEG.contents)
		{
			if (i > HRYWBXUC)
				continue;
			var VWMSDVHT:TextInventoryItem = new TextInventoryItem(item, 0, i * UZJAPHXG);
			VWMSDVHT.ID = i;
			PZIVYBDI.add(VWMSDVHT);
		}
	}

	public function WURLIOGJ()
	{
		for (ICWYWULV in GUMBJBAF.members)
		{
			var LORCFCHQ:TextInventoryItem = cast ICWYWULV;
			LORCFCHQ.color = FlxColor.WHITE;
			if (UVNXOYNK == LORCFCHQ.ID && !IFKCLSFY)
				LORCFCHQ.color = FlxColor.YELLOW;
			final VWNFYBMG = Global.MIXXABIZ.contents[LORCFCHQ.ID + LXUVPJPS];
			if (JWBOBBGP.contains(VWNFYBMG.item.id))
				LORCFCHQ.setColorTransform(0.75, 0.75, 0.75);
			else
				LORCFCHQ.setColorTransform(1.00, 1.00, 1.00);
			LORCFCHQ.text = LORCFCHQ.SVCAAIBG(VWNFYBMG, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$LXUVPJPS)' #else '' #end;
		}
		for (ICWYWULV in PZIVYBDI.members)
		{
			var LORCFCHQ:TextInventoryItem = cast ICWYWULV;
			LORCFCHQ.color = FlxColor.WHITE;
			if (UVNXOYNK == LORCFCHQ.ID && IFKCLSFY)
				LORCFCHQ.color = FlxColor.YELLOW;
			LORCFCHQ.text = LORCFCHQ.SVCAAIBG(Global.CTWGXSEG.contents[LORCFCHQ.ID + TVSMRBFR], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$TVSMRBFR)' #else '' #end;
		}
	}

	public function AOFHEIYV()
	{
		MBWTVFMM.scale.set(FlxG.width / 2, FlxG.height / 2);
		VUUVIEOW.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		XGQSPUPI.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		MBWTVFMM.updateHitbox();
		VUUVIEOW.updateHitbox();
		XGQSPUPI.updateHitbox();
		MBWTVFMM.screenCenter();
		VUUVIEOW.screenCenter();
		XGQSPUPI.screenCenter();
		XGQSPUPI.y = VUUVIEOW.y += 3;
		VUUVIEOW.x = 10;
		XGQSPUPI.x = FlxG.width - XGQSPUPI.width - 10;
		LLZVDFNS(MBWTVFMM, 1);
		LLZVDFNS(VUUVIEOW);
		LLZVDFNS(XGQSPUPI);
	}
}
