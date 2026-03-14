import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var JXKARMMR:Array<String> = [];
	public final SNNTVOVD:Int = 14;
	public var CSSFCSBG:TextGroup;
	public var WCMTICAS:TextGroup;
	public var SAYHOYYK:Int = 0;
	public var CSCFPCSS:Bool = true;
	public var FCQOBPHL:Int = 0;
	public var GTCTIVVV:Int = 0;

	var STTNBNYG = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var SGLYPDUO = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var ZROMGUEL = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		ARWTMZOC();
		AXLSHGZH();
		final SCMCQNQR = Global.LVYKYJDP.MWTIIIJL;
		null;
		for (IPFUSWKY in Global.XZILHWRX.UJALCOZM)
		{
			var ELSWUSDG:Bool = false;
			for (i => ingredientGroups in IPFUSWKY.ingredientItems)
			{
				if (ELSWUSDG)
					continue;
				var OQIYZCFE = 0;
				var MQVGQPYU = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					OQIYZCFE++;
					if (SCMCQNQR.exists(itemId))
						if (SCMCQNQR.get(itemId) >= itemStack)
							MQVGQPYU++;
					if (MQVGQPYU < OQIYZCFE)
					{
						ELSWUSDG = true;
						JXKARMMR.push(IPFUSWKY.item.id);
						null;
					}
				}
			}
		}
	}

	override function update(OMMFMSPL:Float)
	{
		super.update(OMMFMSPL);
		UFFZNDII();
		GXJIIGES();
	}

	public function UFFZNDII()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.UPGGIWZK == 2)
				QGSLUMWT(new StateCave());
			else
				QGSLUMWT(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			SAYHOYYK--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			SAYHOYYK++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				GTCTIVVV--;
			else
				FCQOBPHL--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				GTCTIVVV++;
			else
				FCQOBPHL++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			SAYHOYYK = 0;
			CSCFPCSS = !CSCFPCSS;
		}
		if (SAYHOYYK < 0)
		{
			SAYHOYYK = SNNTVOVD;
			if (CSCFPCSS)
				FCQOBPHL--;
			else
				GTCTIVVV--;
		}
		if (SAYHOYYK > SNNTVOVD)
		{
			SAYHOYYK = 0;
			if (CSCFPCSS)
				FCQOBPHL++;
			else
				GTCTIVVV++;
		}
		if (SAYHOYYK > Global.LVYKYJDP.UJALCOZM.length - 1)
			SAYHOYYK = 0;
		if (FCQOBPHL < 0)
			FCQOBPHL = Global.LVYKYJDP.UJALCOZM.length - ((SNNTVOVD * 1) + 1);
		if (FCQOBPHL > Global.LVYKYJDP.UJALCOZM.length - ((SNNTVOVD * 1) + 1))
			FCQOBPHL = 0;
		if (GTCTIVVV < 0)
			GTCTIVVV = Global.XZILHWRX.UJALCOZM.length - ((SNNTVOVD * 1) + 1);
		if (GTCTIVVV > Global.XZILHWRX.UJALCOZM.length - ((SNNTVOVD * 1) + 1))
			GTCTIVVV = 0;
		FlxG.watch.addQuick('curSelect', SAYHOYYK);
		FlxG.watch.addQuick('inventoryOffset', FCQOBPHL);
		FlxG.watch.addQuick('itemListOffset', GTCTIVVV);
	}

	public function AXLSHGZH()
	{
		CSSFCSBG = new TextGroup(SGLYPDUO.x, SGLYPDUO.y);
		WCMTICAS = new TextGroup(ZROMGUEL.x, ZROMGUEL.y);
		add(CSSFCSBG);
		add(WCMTICAS);
		final LHHBIRFS = 32;
		for (i => item in Global.XZILHWRX.UJALCOZM)
		{
			if (i > SNNTVOVD)
				continue;
			var SLQVZPUS:TextInventoryItem = new TextInventoryItem(item, 0, i * LHHBIRFS);
			SLQVZPUS.ID = i;
			WCMTICAS.add(SLQVZPUS);
		}
		for (i => item in Global.LVYKYJDP.UJALCOZM)
		{
			if (i > SNNTVOVD)
				continue;
			var SLQVZPUS:TextInventoryItem = new TextInventoryItem(item, 0, i * LHHBIRFS);
			SLQVZPUS.ID = i;
			CSSFCSBG.add(SLQVZPUS);
		}
	}

	public function GXJIIGES()
	{
		for (GFLMRKNA in WCMTICAS.members)
		{
			var VFVHNMUQ:TextInventoryItem = cast GFLMRKNA;
			VFVHNMUQ.color = FlxColor.WHITE;
			if (SAYHOYYK == VFVHNMUQ.ID && !CSCFPCSS)
				VFVHNMUQ.color = FlxColor.YELLOW;
			final QOZKKHBZ = Global.XZILHWRX.UJALCOZM[VFVHNMUQ.ID + GTCTIVVV];
			if (JXKARMMR.contains(QOZKKHBZ.item.id))
				VFVHNMUQ.setColorTransform(0.75, 0.75, 0.75);
			else
				VFVHNMUQ.setColorTransform(1.00, 1.00, 1.00);
			VFVHNMUQ.text = VFVHNMUQ.FKRYJADX(QOZKKHBZ, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$GTCTIVVV)' #else '' #end;
		}
		for (GFLMRKNA in CSSFCSBG.members)
		{
			var VFVHNMUQ:TextInventoryItem = cast GFLMRKNA;
			VFVHNMUQ.color = FlxColor.WHITE;
			if (SAYHOYYK == VFVHNMUQ.ID && CSCFPCSS)
				VFVHNMUQ.color = FlxColor.YELLOW;
			VFVHNMUQ.text = VFVHNMUQ.FKRYJADX(Global.LVYKYJDP.UJALCOZM[VFVHNMUQ.ID + FCQOBPHL], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$FCQOBPHL)' #else '' #end;
		}
	}

	public function ARWTMZOC()
	{
		STTNBNYG.scale.set(FlxG.width / 2, FlxG.height / 2);
		SGLYPDUO.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		ZROMGUEL.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		STTNBNYG.updateHitbox();
		SGLYPDUO.updateHitbox();
		ZROMGUEL.updateHitbox();
		STTNBNYG.screenCenter();
		SGLYPDUO.screenCenter();
		ZROMGUEL.screenCenter();
		ZROMGUEL.y = SGLYPDUO.y += 3;
		SGLYPDUO.x = 10;
		ZROMGUEL.x = FlxG.width - ZROMGUEL.width - 10;
		UNSIKWET(STTNBNYG, 1);
		UNSIKWET(SGLYPDUO);
		UNSIKWET(ZROMGUEL);
	}
}
