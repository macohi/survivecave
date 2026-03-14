import flixel.util.FlxColor;
import flixel.FlxG;
class StateInventory extends State {
    public var BSTUJVAC:Array<String> = [];
    public final ESQWAAWC:Int = 14;
    public var JUJUQKAZ:TextGroup;
    public var IDJZQXRB:TextGroup;
    public var CCURVBUN:Int = 0;
    public var ZTMSKUXP:Bool = true;
    public var PFVVQZRM:Int = 0;
    public var YJSEJKIV:Int = 0;
    var KWNGQSEQ = new SpriteGraphic(2, 2, FlxColor.fromString('0x1E1E38'));
    var RCDOYIIC = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), 0, 6);
    var FUFENUAV = new SpriteGraphic(2, 2, FlxColor.fromString('0x383866'), Math.floor(FlxG.width / 2), 6);
    override function create() {
		super.create();
		VOIEYNWQ();
		JSNBVEKU();
		final ZAOMNACJ = Global.FZNOVQXF.ingredientsMap;
		trace(ZAOMNACJ);
		for (inventoryItem in Global.IRFZTZAR.contents)
		{
			var JKHYDDSR:Bool = false;
			for (i => ingredientGroups in inventoryItem.ingredientItems)
			{
				if (JKHYDDSR)
					continue;
				var VHHILEQB = 0;
				var QICIXYQF = 0;
				for (itemId => itemStack in ingredientGroups)
				{
					VHHILEQB++;
					if (ZAOMNACJ.exists(itemId))
						if (ZAOMNACJ.get(itemId) >= itemStack)
							QICIXYQF++;
					if (QICIXYQF < VHHILEQB)
					{
						JKHYDDSR = true;
						BSTUJVAC.push(inventoryItem.item.id);
						trace('${inventoryItem.item.id} : ${inventoryItem.ingredientItems[i]}');
					}
				}
			}
		}
	}
    override function update(WUTVIWHQ:Float) {
		super.update(WUTVIWHQ);
		HLXSIBMB();
		CDWFUCMI();
	}
    public function HLXSIBMB() {
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.DOJMICLH == 2)
				LVPUFLLX(new StateCave());
			else
				LVPUFLLX(new StateGame());
		}
		if (FlxG.keys.anyJustReleased([W, UP]))
		{
			CCURVBUN--;
		}
		if (FlxG.keys.anyJustReleased([S, DOWN]))
		{
			CCURVBUN++;
		}
		if (FlxG.keys.anyJustReleased([A, LEFT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				YJSEJKIV--;
			else
				PFVVQZRM--;
		}
		if (FlxG.keys.anyJustReleased([D, RIGHT]))
		{
			if (FlxG.keys.pressed.SHIFT)
				YJSEJKIV++;
			else
				PFVVQZRM++;
		}
		if (FlxG.keys.anyJustReleased([TAB]))
		{
			CCURVBUN = 0;
			ZTMSKUXP = !ZTMSKUXP;
		}
		if (CCURVBUN < 0)
		{
			CCURVBUN = ESQWAAWC;
			if (ZTMSKUXP)
				PFVVQZRM--;
			else
				YJSEJKIV--;
		}
		if (CCURVBUN > ESQWAAWC)
		{
			CCURVBUN = 0;
			if (ZTMSKUXP)
				PFVVQZRM++;
			else
				YJSEJKIV++;
		}
		if (CCURVBUN > Global.FZNOVQXF.contents.length - 1)
			CCURVBUN = 0;
		if (PFVVQZRM < 0)
			PFVVQZRM = Global.FZNOVQXF.contents.length - ((ESQWAAWC * 1) + 1);
		if (PFVVQZRM > Global.FZNOVQXF.contents.length - ((ESQWAAWC * 1) + 1))
			PFVVQZRM = 0;
		if (YJSEJKIV < 0)
			YJSEJKIV = Global.IRFZTZAR.contents.length - ((ESQWAAWC * 1) + 1);
		if (YJSEJKIV > Global.IRFZTZAR.contents.length - ((ESQWAAWC * 1) + 1))
			YJSEJKIV = 0;
		FlxG.watch.addQuick('curSelect', CCURVBUN);
		FlxG.watch.addQuick('inventoryOffset', PFVVQZRM);
		FlxG.watch.addQuick('itemListOffset', YJSEJKIV);
	}
    public function JSNBVEKU() {
		JUJUQKAZ = new TextGroup(RCDOYIIC.x, RCDOYIIC.y);
		IDJZQXRB = new TextGroup(FUFENUAV.x, FUFENUAV.y);
		add(JUJUQKAZ);
		add(IDJZQXRB);
		final PWXMOFFP = 32;
		for (i => item in Global.IRFZTZAR.contents)
		{
			if (i > ESQWAAWC)
				continue;
			var YBFSAVVQ:TextInventoryItem = new TextInventoryItem(item, 0, i * PWXMOFFP);
			YBFSAVVQ.ID = i;
			IDJZQXRB.add(YBFSAVVQ);
		}
		for (i => item in Global.FZNOVQXF.contents)
		{
			if (i > ESQWAAWC)
				continue;
			var YBFSAVVQ:TextInventoryItem = new TextInventoryItem(item, 0, i * PWXMOFFP);
			YBFSAVVQ.ID = i;
			JUJUQKAZ.add(YBFSAVVQ);
		}
	}
    public function CDWFUCMI() {
		for (text in IDJZQXRB.members)
		{
			var PMETFXWI:TextInventoryItem = cast text;
			PMETFXWI.color = FlxColor.WHITE;
			if (CCURVBUN == PMETFXWI.ID && !ZTMSKUXP)
				PMETFXWI.color = FlxColor.YELLOW;
			final BMLZSERQ = Global.IRFZTZAR.contents[PMETFXWI.ID + YJSEJKIV];
			if (BSTUJVAC.contains(BMLZSERQ.item.id))
				PMETFXWI.setColorTransform(0.75, 0.75, 0.75);
			else
				PMETFXWI.setColorTransform(1.00, 1.00, 1.00);
			PMETFXWI.text = PMETFXWI.IQDRGNFY(BMLZSERQ, false) + #if DISPLAY_INVENTORY_OFFSETS ' (+$itemListOffset)' #else '' #end;
		}
		for (text in JUJUQKAZ.members)
		{
			var PMETFXWI:TextInventoryItem = cast text;
			PMETFXWI.color = FlxColor.WHITE;
			if (CCURVBUN == PMETFXWI.ID && ZTMSKUXP)
				PMETFXWI.color = FlxColor.YELLOW;
			PMETFXWI.text = PMETFXWI.IQDRGNFY(Global.FZNOVQXF.contents[PMETFXWI.ID + PFVVQZRM], true)
				+ #if DISPLAY_INVENTORY_OFFSETS ' (+$inventoryOffset)' #else '' #end;
		}
	}
    public function VOIEYNWQ() {
		KWNGQSEQ.scale.set(FlxG.width / 2, FlxG.height / 2);
		RCDOYIIC.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		FUFENUAV.scale.set((Math.floor(FlxG.width / 2) / 2) - 10, (FlxG.height - 12) / 2);
		KWNGQSEQ.updateHitbox();
		RCDOYIIC.updateHitbox();
		FUFENUAV.updateHitbox();
		KWNGQSEQ.screenCenter();
		RCDOYIIC.screenCenter();
		FUFENUAV.screenCenter();
		FUFENUAV.y = RCDOYIIC.y += 3;
		RCDOYIIC.x = 10;
		FUFENUAV.x = FlxG.width - FUFENUAV.width - 10;
		WULSCJWC(KWNGQSEQ, 1);
		WULSCJWC(RCDOYIIC);
		WULSCJWC(FUFENUAV);
	}
}
