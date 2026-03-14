import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var YBKBNLFG:Array<String> = [];
	public final MJYITAZH:Int = 14;
	public var MHAGULXC:TextGroup;
	public var NLWUTSQM:TextGroup;
	public var ZYFZGJEJ:Int = 0;
	public var XNQEQDZT:Bool = true;
	public var JSKYLMGM:Int = 0;
	public var GBZSDSQV:Int = 0;

	var NOVQJQPQ = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var NSGYTSST = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var ZUEBTCBM = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		YOZCWZWL();
		IZMVVILK();
		final HHNMMESR = Global.ACEZMXCM.GQGMCKNC;
		null;
		for (RAWHODJU in Global.HWLYGKEE.YRKOSOYV)
		{
			var BCMYDPLX:Bool = false;
			for (i => ingredientGroups in RAWHODJU.ingredientItems)
			{
				if (BCMYDPLX)
					continue;
				var TWOKMSFK = 0;
				var QWMDGTPP = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					TWOKMSFK++;
					if (HHNMMESR.exists(itemId))
						if (HHNMMESR.get(itemId) >= itemStack)
							QWMDGTPP++;
					if (QWMDGTPP < TWOKMSFK)
					{
						BCMYDPLX = true;
						YBKBNLFG.push(RAWHODJU.item.id);
						null;
					}
				}
			}
		}
	}

	override function update(YZNQNMLQ:Float)
	{
		super.update(YZNQNMLQ);
		VIZMQUOD();
		YPDZOSAK();
	}

	public function VIZMQUOD()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.DVTKADIU == 2)
				LPFEOCHX(new StateCave());
			else
				LPFEOCHX(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			ZYFZGJEJ--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			ZYFZGJEJ++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				GBZSDSQV--;
			else
				JSKYLMGM--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				GBZSDSQV++;
			else
				JSKYLMGM++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			ZYFZGJEJ = 0;
			XNQEQDZT = !XNQEQDZT;
		}
		if (ZYFZGJEJ < 0)
		{
			ZYFZGJEJ = MJYITAZH;
			if (XNQEQDZT)
				JSKYLMGM--;
			else
				GBZSDSQV--;
		}
		if (ZYFZGJEJ > MJYITAZH)
		{
			ZYFZGJEJ = 0;
			if (XNQEQDZT)
				JSKYLMGM++;
			else
				GBZSDSQV++;
		}
		if (ZYFZGJEJ > Global.ACEZMXCM.YRKOSOYV.length - 1)
			ZYFZGJEJ = 0;
		if (JSKYLMGM < 0)
			JSKYLMGM = Global.ACEZMXCM.YRKOSOYV.length - ((MJYITAZH * 1) + 1);
		if (JSKYLMGM > Global.ACEZMXCM.YRKOSOYV.length - ((MJYITAZH * 1) + 1))
			JSKYLMGM = 0;
		if (GBZSDSQV < 0)
			GBZSDSQV = Global.HWLYGKEE.YRKOSOYV.length - ((MJYITAZH * 1) + 1);
		if (GBZSDSQV > Global.HWLYGKEE.YRKOSOYV.length - ((MJYITAZH * 1) + 1))
			GBZSDSQV = 0;
		FlxG.watch.addQuick('curSelect', ZYFZGJEJ);
		FlxG.watch.addQuick('inventoryOffset', JSKYLMGM);
		FlxG.watch.addQuick('itemListOffset', GBZSDSQV);
	}

	public function IZMVVILK()
	{
		MHAGULXC = new TextGroup(NSGYTSST.x, NSGYTSST.y);
		NLWUTSQM = new TextGroup(ZUEBTCBM.x, ZUEBTCBM.y);
		add(MHAGULXC);
		add(NLWUTSQM);
		final DUGMLFLI = 32;
		for (i => item in Global.HWLYGKEE.YRKOSOYV)
		{
			if (i > MJYITAZH)
				continue;
			var HVXFAQWX:TextInventoryItem = new TextInventoryItem(item, 0, i * DUGMLFLI);
			HVXFAQWX.ID = i;
			NLWUTSQM.add(HVXFAQWX);
		}
		for (i => item in Global.ACEZMXCM.YRKOSOYV)
		{
			if (i > MJYITAZH)
				continue;
			var HVXFAQWX:TextInventoryItem = new TextInventoryItem(item, 0, i * DUGMLFLI);
			HVXFAQWX.ID = i;
			MHAGULXC.add(HVXFAQWX);
		}
	}

	public function YPDZOSAK()
	{
		for (RAKURHFT in NLWUTSQM.members)
		{
			var MFULXMTN:TextInventoryItem = cast RAKURHFT;
			MFULXMTN.color = FlxColor.WHITE;
			if (ZYFZGJEJ == MFULXMTN.ID && !XNQEQDZT)
				MFULXMTN.color = FlxColor.YELLOW;
			final PHYVATJX = Global.HWLYGKEE.YRKOSOYV[MFULXMTN.ID + GBZSDSQV];
			if (YBKBNLFG.contains(PHYVATJX.item.id))
				MFULXMTN.setColorTransform(0.75, 0.75, 0.75);
			else
				MFULXMTN.setColorTransform(1.00, 1.00, 1.00);
			MFULXMTN.text = MFULXMTN.DJAVODCB(PHYVATJX, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$GBZSDSQV)' #else '' #end;
		}
		for (RAKURHFT in MHAGULXC.members)
		{
			var MFULXMTN:TextInventoryItem = cast RAKURHFT;
			MFULXMTN.color = FlxColor.WHITE;
			if (ZYFZGJEJ == MFULXMTN.ID && XNQEQDZT)
				MFULXMTN.color = FlxColor.YELLOW;
			MFULXMTN.text = MFULXMTN.DJAVODCB(Global.ACEZMXCM.YRKOSOYV[MFULXMTN.ID + JSKYLMGM], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$JSKYLMGM)' #else '' #end;
		}
	}

	public function YOZCWZWL()
	{
		NOVQJQPQ.scale.set(FlxG.width / 2, FlxG.height / 2);
		NSGYTSST.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		ZUEBTCBM.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		NOVQJQPQ.updateHitbox();
		NSGYTSST.updateHitbox();
		ZUEBTCBM.updateHitbox();
		NOVQJQPQ.screenCenter();
		NSGYTSST.screenCenter();
		ZUEBTCBM.screenCenter();
		ZUEBTCBM.y = NSGYTSST.y += 3;
		NSGYTSST.x = 10;
		ZUEBTCBM.x = FlxG.width - ZUEBTCBM.width - 10;
		QMSFUNDU(NOVQJQPQ, 1);
		QMSFUNDU(NSGYTSST);
		QMSFUNDU(ZUEBTCBM);
	}
}
