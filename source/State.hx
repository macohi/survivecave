import flixel.FlxG;
import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;
class State extends FlxState {
    public var WTDEVYBY:Array<FlxTypedContainer<FlxBasic>> = [];
    var JOMZDRKL:Null<Int> = null;
    public function WULSCJWC(NTMNWPAH:FlxBasic, UEGPXWYQ:Null<Int>) {
		if (NTMNWPAH == null)
		{
			trace('Adding null FlxBasic object unsupported.');
			return;
		}
		if (layer == null)
		{
			if (JOMZDRKL == null)
			{
				JOMZDRKL = 0;
			}
			layer = JOMZDRKL + 1;
		}
		else
		{
			JOMZDRKL = layer;
		}
		if (WTDEVYBY == null)
		{
			trace('"layers" variable uninitalized or destroyed. Reinitalizing...');
			WTDEVYBY = [];
		}
		while (WTDEVYBY.length < layer)
		{
			final HDWFFFHC = new FlxTypedContainer<FlxBasic>();
			HDWFFFHC.ID = WTDEVYBY.length;
			WTDEVYBY.push(HDWFFFHC);
			add(HDWFFFHC);
		}
		JPKTUDAT(NTMNWPAH, layer);
	}
    public function JPKTUDAT(UKEFYVRJ:FlxBasic, GPDSVPUP:Null<Int>) {
		if (UKEFYVRJ == null)
		{
			trace('A non-null FlxBasic object required.');
			return;
		}
		if (GPDSVPUP == null)
		{
			trace('A proper layer required.');
			return;
		}
		if (GPDSVPUP > WTDEVYBY.length || WTDEVYBY[GPDSVPUP - 1] == null)
		{
			trace('Cannot switch to non-existant layer');
			return;
		}
		for (GPDSVPUP in WTDEVYBY)
		{
			if (GPDSVPUP.members.contains(UKEFYVRJ))
				GPDSVPUP.remove(UKEFYVRJ);
		}
		WTDEVYBY[GPDSVPUP - 1].add(UKEFYVRJ);
	}
    public function LVPUFLLX(MGGYXOIX:State) {
		FlxG.switchState(() -> MGGYXOIX);
	}
}
