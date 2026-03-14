import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var JKTPBAVI:Array<String> = [];
	public final VRTVFHID:Int = 14;
	public var TSQNUOCE:TextGroup;
	public var FHHFDKFI:TextGroup;
	public var KOGPXVQA:Int = 0;
	public var MFRLKNNS:Bool = true;
	public var TNUHCBFM:Int = 0;
	public var CJHHZXIY:Int = 0;

	var NITXMEHJ:SpriteGraphic = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var OHDFTPWB:SpriteGraphic = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var JWBFLKIC:SpriteGraphic = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		KYENZWHR();
		DSEULEXZ();
		final TWVDDGNH:Map<String, Int> = Global.KGDMAAGE.RGFUUDRU;
		null;
		for (DEKUQEGL in Global.DAMUSFDW.NSOGSLFA)
		{
			var KHCBZFMK:Bool = false;
			for (i => ingredientGroups in DEKUQEGL.ZVRHEVFA)
			{
				if (KHCBZFMK)
					continue;
				var YRPLOMKG:Int = 0;
				var DKDGXFUZ:Int = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					YRPLOMKG++;
					if (TWVDDGNH.exists(itemId))
						if (TWVDDGNH.get(itemId) >= itemStack)
							DKDGXFUZ++;
					if (DKDGXFUZ < YRPLOMKG)
					{
						KHCBZFMK = true;
						JKTPBAVI.push(DEKUQEGL.QFKSAJOY.RRAJBBNZ);
						null;
					}
				}
			}
		}
	}

	override function update(WLGUZUDX:Float)
	{
		super.update(WLGUZUDX);
		QGYFEXNU();
		FFJYNFBL();
	}

	public function QGYFEXNU()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.AXUHRJTP == 2)
				LEFMGEJF(new StateCave());
			else
				LEFMGEJF(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			KOGPXVQA--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			KOGPXVQA++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				CJHHZXIY--;
			else
				TNUHCBFM--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				CJHHZXIY++;
			else
				TNUHCBFM++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			KOGPXVQA = 0;
			MFRLKNNS = !MFRLKNNS;
		}
		if (KOGPXVQA < 0)
		{
			KOGPXVQA = VRTVFHID;
			if (MFRLKNNS)
				TNUHCBFM--;
			else
				CJHHZXIY--;
		}
		if (KOGPXVQA > VRTVFHID)
		{
			KOGPXVQA = 0;
			if (MFRLKNNS)
				TNUHCBFM++;
			else
				CJHHZXIY++;
		}
		if (KOGPXVQA > Global.KGDMAAGE.NSOGSLFA.length - 1)
			KOGPXVQA = 0;
		if (TNUHCBFM < 0)
			TNUHCBFM = Global.KGDMAAGE.NSOGSLFA.length - ((VRTVFHID * 1) + 1);
		if (TNUHCBFM > Global.KGDMAAGE.NSOGSLFA.length - ((VRTVFHID * 1) + 1))
			TNUHCBFM = 0;
		if (CJHHZXIY < 0)
			CJHHZXIY = Global.DAMUSFDW.NSOGSLFA.length - ((VRTVFHID * 1) + 1);
		if (CJHHZXIY > Global.DAMUSFDW.NSOGSLFA.length - ((VRTVFHID * 1) + 1))
			CJHHZXIY = 0;
		FlxG.watch.addQuick('curSelect', KOGPXVQA);
		FlxG.watch.addQuick('inventoryOffset', TNUHCBFM);
		FlxG.watch.addQuick('itemListOffset', CJHHZXIY);
	}

	public function DSEULEXZ()
	{
		TSQNUOCE = new TextGroup(OHDFTPWB.x, OHDFTPWB.y);
		FHHFDKFI = new TextGroup(JWBFLKIC.x, JWBFLKIC.y);
		add(TSQNUOCE);
		add(FHHFDKFI);
		final ZJUZRYWW:Int = 32;
		for (i => item in Global.DAMUSFDW.NSOGSLFA)
		{
			if (i > VRTVFHID)
				continue;
			var YWTGXDQP:TextInventoryItem = new TextInventoryItem(item, 0, i * ZJUZRYWW);
			YWTGXDQP.ID = i;
			FHHFDKFI.add(YWTGXDQP);
		}
		for (i => item in Global.KGDMAAGE.NSOGSLFA)
		{
			if (i > VRTVFHID)
				continue;
			var YWTGXDQP:TextInventoryItem = new TextInventoryItem(item, 0, i * ZJUZRYWW);
			YWTGXDQP.ID = i;
			TSQNUOCE.add(YWTGXDQP);
		}
	}

	public function FFJYNFBL()
	{
		for (RJMACGMG in FHHFDKFI.members)
		{
			var XBNNJLVI:TextInventoryItem = cast RJMACGMG;
			XBNNJLVI.color = FlxColor.WHITE;
			if (KOGPXVQA == XBNNJLVI.ID && !MFRLKNNS)
				XBNNJLVI.color = FlxColor.YELLOW;
			final EOVASORM:InventoryItem = Global.DAMUSFDW.NSOGSLFA[XBNNJLVI.ID + CJHHZXIY];
			if (JKTPBAVI.contains(EOVASORM.QFKSAJOY.RRAJBBNZ))
				XBNNJLVI.setColorTransform(0.75, 0.75, 0.75);
			else
				XBNNJLVI.setColorTransform(1.00, 1.00, 1.00);
			XBNNJLVI.text = XBNNJLVI.GXKHWRHF(EOVASORM, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$CJHHZXIY)' #else '' #end;
		}
		for (RJMACGMG in TSQNUOCE.members)
		{
			var XBNNJLVI:TextInventoryItem = cast RJMACGMG;
			XBNNJLVI.color = FlxColor.WHITE;
			if (KOGPXVQA == XBNNJLVI.ID && MFRLKNNS)
				XBNNJLVI.color = FlxColor.YELLOW;
			final EOVASORM:InventoryItem = Global.KGDMAAGE.NSOGSLFA[XBNNJLVI.ID + TNUHCBFM];
			XBNNJLVI.text = XBNNJLVI.GXKHWRHF(EOVASORM, true) + #if DISPLAY_INVENTORY_OFFSETS ' (+$TNUHCBFM)' #else '' #end;
		}
	}

	public function KYENZWHR()
	{
		NITXMEHJ.scale.set(FlxG.width / 2, FlxG.height / 2);
		OHDFTPWB.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		JWBFLKIC.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		NITXMEHJ.updateHitbox();
		OHDFTPWB.updateHitbox();
		JWBFLKIC.updateHitbox();
		NITXMEHJ.screenCenter();
		OHDFTPWB.screenCenter();
		JWBFLKIC.screenCenter();
		JWBFLKIC.y = OHDFTPWB.y += 3;
		OHDFTPWB.x = 10;
		JWBFLKIC.x = FlxG.width - JWBFLKIC.width - 10;
		SMIXXKUZ(NITXMEHJ, 1);
		SMIXXKUZ(OHDFTPWB);
		SMIXXKUZ(JWBFLKIC);
	}
}
