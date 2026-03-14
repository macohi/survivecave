package states.gui;

import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;

class GUIShop extends StateGUI
{
	public var guiSpr:SpriteShopGUI = new SpriteShopGUI();

	public var repeatBG:FlxBackdrop;

	override function create()
	{
		super.create();

		repeatBG = new FlxBackdrop(StateInit.cave_world_backdrop.group.members[0].graphic, XY);
		addToLayer(repeatBG, 1);
		repeatBG.scale.set(4, 4);

		addToLayer(guiSpr, 10);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		repeatBG.y -= repeatBG.scale.y / 4;

		applyControls();
	}

	public function applyControls()
	{
		if (FlxG.keys.anyJustReleased([ESCAPE]))
		{
			if (Global.LAST_GAMEPLAY_STATE.value == 2)
				switchState(new StateCave());
			else
				switchState(new StateGame());
		}
	}
}
