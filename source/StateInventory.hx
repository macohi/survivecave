import flixel.util.FlxColor;
import flixel.FlxG;

class StateInventory extends State
{
	public var kkaa:Array<String> = [];
	public final kadk:Int = 14;
	public var edda:TextGroup;
	public var kkad:TextGroup;
	public var aaek:Int = 0;
	public var eeed:Bool = true;
	public var kdkd:Int = 0;
	public var aadk:Int = 0;

	var eaka:SpriteGraphic = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
	var ekee:SpriteGraphic = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
	var ddea:SpriteGraphic = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);

	override function create()
	{
		super.create();
		akke();
		kadd();
		final deaa:Map<String, Int> = Global.eakd.ekdk;
		null;
		for (adae in Global.dkdd.eeke)
		{
			var ddkk:Bool = false;
			for (i => ingredientGroups in adae.deak)
			{
				if (ddkk)
					continue;
				var ddad:Int = 0;
				var ekak:Int = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					ddad++;
					if (deaa.exists(itemId))
						if (deaa.get(itemId) >= itemStack)
							ekak++;
					if (ekak < ddad)
					{
						ddkk = true;
						kkaa.push(adae.dade.keee);
						null;
					}
				}
			}
		}
	}

	override function update(eekd:Float)
	{
		super.update(eekd);
		dkkd();
		akde();
	}

	public function dkkd()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.daka == 2)
				eedk(new StateCave());
			else
				eedk(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			aaek--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			aaek++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				aadk--;
			else
				kdkd--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				aadk++;
			else
				kdkd++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			aaek = 0;
			eeed = !eeed;
		}
		if (aaek < 0)
		{
			aaek = kadk;
			if (eeed)
				kdkd--;
			else
				aadk--;
		}
		if (aaek > kadk)
		{
			aaek = 0;
			if (eeed)
				kdkd++;
			else
				aadk++;
		}
		if (aaek > Global.eakd.eeke.length - 1)
			aaek = 0;
		if (kdkd < 0)
			kdkd = Global.eakd.eeke.length - ((kadk * 1) + 1);
		if (kdkd > Global.eakd.eeke.length - ((kadk * 1) + 1))
			kdkd = 0;
		if (aadk < 0)
			aadk = Global.dkdd.eeke.length - ((kadk * 1) + 1);
		if (aadk > Global.dkdd.eeke.length - ((kadk * 1) + 1))
			aadk = 0;
		FlxG.watch.addQuick('curSelect', aaek);
		FlxG.watch.addQuick('inventoryOffset', kdkd);
		FlxG.watch.addQuick('itemListOffset', aadk);
	}

	public function kadd()
	{
		edda = new TextGroup(ekee.x, ekee.y);
		kkad = new TextGroup(ddea.x, ddea.y);
		add(edda);
		add(kkad);
		final kaea:Int = 32;
		for (i => item in Global.dkdd.eeke)
		{
			if (i > kadk)
				continue;
			var akae:TextInventoryItem = new TextInventoryItem(item, 0, i * kaea);
			akae.ID = i;
			kkad.add(akae);
		}
		for (i => item in Global.eakd.eeke)
		{
			if (i > kadk)
				continue;
			var akae:TextInventoryItem = new TextInventoryItem(item, 0, i * kaea);
			akae.ID = i;
			edda.add(akae);
		}
	}

	public function akde()
	{
		for (eedd in kkad.members)
		{
			var ekkd:TextInventoryItem = cast eedd;
			ekkd.color = FlxColor.WHITE;
			if (aaek == ekkd.ID && !eeed)
				ekkd.color = FlxColor.YELLOW;
			final eaee:InventoryItem = Global.dkdd.eeke[ekkd.ID + aadk];
			if (kkaa.contains(eaee.dade.keee))
				ekkd.setColorTransform(0.75, 0.75, 0.75);
			else
				ekkd.setColorTransform(1.00, 1.00, 1.00);
			ekkd.text = ekkd.dkad(eaee, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$aadk)' #else '' #end;
		}
		for (eedd in edda.members)
		{
			var ekkd:TextInventoryItem = cast eedd;
			ekkd.color = FlxColor.WHITE;
			if (aaek == ekkd.ID && eeed)
				ekkd.color = FlxColor.YELLOW;
			final eaee:InventoryItem = Global.eakd.eeke[ekkd.ID + kdkd];
			ekkd.text = ekkd.dkad(eaee, true) + #if DISPLAY_INVENTORY_OFFSETS ' (+$kdkd)' #else '' #end;
		}
	}

	public function akke()
	{
		eaka.scale.set(FlxG.width / 2, FlxG.height / 2);
		ekee.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		ddea.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		eaka.updateHitbox();
		ekee.updateHitbox();
		ddea.updateHitbox();
		eaka.screenCenter();
		ekee.screenCenter();
		ddea.screenCenter();
		ddea.y = ekee.y += 3;
		ekee.x = 10;
		ddea.x = FlxG.width - ddea.width - 10;
		akad(eaka, 1);
		akad(ekee);
		akad(ddea);
	}
}
