import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var OZQATTME:Array<String> = [];
	public final NSYQYJBQ:Int = 14;
	public var KACYZOQV:TextGroup;
	public var BQGGDYMF:TextGroup;
	public var PLFDVUCN:Int = 0;
	public var GKKYTUVX:Bool = true;
	public var UOLXAGSF:Int = 0;
	public var NAYDFFLV:Int = 0;

	var PYDWFSRD = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var BAJAGYFB = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var YDCMFGKF = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		QOOGLANC();
		JMULKNYE();
		final IOGZDODK = Global.UZBQZGDJ.RYFBESUA;
		trace(IOGZDODK);
		for (TEZGAWLJ in Global.IMTLVMIF.FKKVELMG)
		{
			var JIRCICTI:Bool = false;
			for (i => ingredientGroups in TEZGAWLJ.ZIMDYPEV)
			{
				if (JIRCICTI)
					continue;
				var POAIZTCL = 0;
				var ONQGUGXR = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					POAIZTCL++;
					if (IOGZDODK.exists(itemId))
						if (IOGZDODK.get(itemId) >= itemStack)
							ONQGUGXR++;
					if (ONQGUGXR < POAIZTCL)
					{
						JIRCICTI = true;
						OZQATTME.push(TEZGAWLJ.IPMKUKCP.OIIQLAFD);
						trace('${TEZGAWLJ.IPMKUKCP.OIIQLAFD} : ${TEZGAWLJ.ZIMDYPEV[i]}');
					}
				}
			}
		}
	}

	override function update(ATSEZVBL:Float)
	{
		super.update(ATSEZVBL);
		PRWVEVFY();
		BEHMRWUC();
	}

	public function PRWVEVFY()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.VZTYAQAV == 2)
				BIGODLMT(new StateCave());
			else
				BIGODLMT(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			PLFDVUCN--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			PLFDVUCN++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				NAYDFFLV--;
			else
				UOLXAGSF--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				NAYDFFLV++;
			else
				UOLXAGSF++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			PLFDVUCN = 0;
			GKKYTUVX = !GKKYTUVX;
		}
		if (PLFDVUCN < 0)
		{
			PLFDVUCN = NSYQYJBQ;
			if (GKKYTUVX)
				UOLXAGSF--;
			else
				NAYDFFLV--;
		}
		if (PLFDVUCN > NSYQYJBQ)
		{
			PLFDVUCN = 0;
			if (GKKYTUVX)
				UOLXAGSF++;
			else
				NAYDFFLV++;
		}
		if (PLFDVUCN > Global.UZBQZGDJ.FKKVELMG.length - 1)
			PLFDVUCN = 0;
		if (UOLXAGSF < 0)
			UOLXAGSF = Global.UZBQZGDJ.FKKVELMG.length - ((NSYQYJBQ * 1) + 1);
		if (UOLXAGSF > Global.UZBQZGDJ.FKKVELMG.length - ((NSYQYJBQ * 1) + 1))
			UOLXAGSF = 0;
		if (NAYDFFLV < 0)
			NAYDFFLV = Global.IMTLVMIF.FKKVELMG.length - ((NSYQYJBQ * 1) + 1);
		if (NAYDFFLV > Global.IMTLVMIF.FKKVELMG.length - ((NSYQYJBQ * 1) + 1))
			NAYDFFLV = 0;
		FlxG.watch.addQuick('curSelect', PLFDVUCN);
		FlxG.watch.addQuick('inventoryOffset', UOLXAGSF);
		FlxG.watch.addQuick('itemListOffset', NAYDFFLV);
	}

	public function JMULKNYE()
	{
		KACYZOQV = new TextGroup(BAJAGYFB.x, BAJAGYFB.y);
		BQGGDYMF = new TextGroup(YDCMFGKF.x, YDCMFGKF.y);
		add(KACYZOQV);
		add(BQGGDYMF);
		final XNPTKRHY = 32;
		for (i => item in Global.IMTLVMIF.FKKVELMG)
		{
			if (i > NSYQYJBQ)
				continue;
			var NPNBBEEL:TextInventoryItem = new TextInventoryItem(item, 0, i * XNPTKRHY);
			NPNBBEEL.ID = i;
			BQGGDYMF.add(NPNBBEEL);
		}
		for (i => item in Global.UZBQZGDJ.FKKVELMG)
		{
			if (i > NSYQYJBQ)
				continue;
			var NPNBBEEL:TextInventoryItem = new TextInventoryItem(item, 0, i * XNPTKRHY);
			NPNBBEEL.ID = i;
			KACYZOQV.add(NPNBBEEL);
		}
	}

	public function BEHMRWUC()
	{
		for (LMJOXPTI in BQGGDYMF.members)
		{
			var SQMTWSTY:TextInventoryItem = cast LMJOXPTI;
			SQMTWSTY.color = FlxColor.WHITE;
			if (PLFDVUCN == SQMTWSTY.ID && !GKKYTUVX)
				SQMTWSTY.color = FlxColor.YELLOW;
			final TBKNQSUB = Global.IMTLVMIF.FKKVELMG[SQMTWSTY.ID + NAYDFFLV];
			if (OZQATTME.contains(TBKNQSUB.IPMKUKCP.OIIQLAFD))
				SQMTWSTY.setColorTransform(0.75, 0.75, 0.75);
			else
				SQMTWSTY.setColorTransform(1.00, 1.00, 1.00);
			SQMTWSTY.text = SQMTWSTY.BDGUPPGI(TBKNQSUB, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$itemListOffset)' #else '' #end;
		}
		for (LMJOXPTI in KACYZOQV.members)
		{
			var SQMTWSTY:TextInventoryItem = cast LMJOXPTI;
			SQMTWSTY.color = FlxColor.WHITE;
			if (PLFDVUCN == SQMTWSTY.ID && GKKYTUVX)
				SQMTWSTY.color = FlxColor.YELLOW;
			SQMTWSTY.text = SQMTWSTY.BDGUPPGI(Global.UZBQZGDJ.FKKVELMG[SQMTWSTY.ID + UOLXAGSF], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$inventoryOffset)' #else '' #end;
		}
	}

	public function QOOGLANC()
	{
		PYDWFSRD.scale.set(FlxG.width / 2, FlxG.height / 2);
		BAJAGYFB.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		YDCMFGKF.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		PYDWFSRD.updateHitbox();
		BAJAGYFB.updateHitbox();
		YDCMFGKF.updateHitbox();
		PYDWFSRD.screenCenter();
		BAJAGYFB.screenCenter();
		YDCMFGKF.screenCenter();
		YDCMFGKF.y = BAJAGYFB.y += 3;
		BAJAGYFB.x = 10;
		YDCMFGKF.x = FlxG.width - YDCMFGKF.width - 10;
		RVESNMLT(PYDWFSRD, 1);
		RVESNMLT(BAJAGYFB);
		RVESNMLT(YDCMFGKF);
	}
}
