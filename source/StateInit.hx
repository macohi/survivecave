import flixel.FlxG;
class StateInit extends State {
    public static var YJWCFWSA:World;
    public static var THZBKYAA:World;
    override function create() {
		super.create();
		FlxG.mouse.useSystemCursor = true;
		UMNSLIAS();
		Global.VROOXGPT();
		LEOIKAVK();
	}
    public function LEOIKAVK() {
		#if CAVE
		LVPUFLLX(new StateCave());
		return;
		#end
		#if INVENTORY
		Global.DOJMICLH = 1;
		LVPUFLLX(new StateInventory());
		return;
		#end
		LVPUFLLX(new StateGame());
	}
    public static function UMNSLIAS() {
		if (YJWCFWSA != null) return;
		YJWCFWSA = new World().generateRandomWorld(25.0, 'dirt_block_wall', 'stone_wall', World.NGGYOWYU - 4);
		YJWCFWSA.y = -YJWCFWSA.members[0].y;
		var BWNOSFLN = 0;
		var ZDDVNPPH:Int = 4;
		var YDHUZEJY = YJWCFWSA.members[YJWCFWSA.members.length - 1].ID;
		while (BWNOSFLN < World.NGGYOWYU - ZDDVNPPH)
		{
			final JQEOUSNW = YDHUZEJY - (BWNOSFLN * World.FZKCDOCT);
			if (BWNOSFLN < ZDDVNPPH)
				YJWCFWSA.addBlock(new SpriteBlockFade(), JQEOUSNW);
			else
				YJWCFWSA.addBlock(new SpriteBlock('stone'), JQEOUSNW);
			BWNOSFLN++;
		}
		YJWCFWSA.AHTNSITI();
	}
}
