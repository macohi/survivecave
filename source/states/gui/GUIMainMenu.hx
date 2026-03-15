package states.gui;

import flixel.FlxG;

class GUIMainMenu extends StateGUI
{
	public var logo:Sprite = new Sprite('logo');

	public var toPlay:Text = new Text('Press ANY to play', null, null, 16);

	override function create()
	{
		super.create();

        Global.LAST_GAMEPLAY_STATE.value = -1;

		add(logo);
		logo.screenCenter();

		add(toPlay);
		toPlay.screenCenter();

		logo.y -= logo.height / 4;
		toPlay.y += logo.height / 4;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.ANY)
			switchState(new StateGround());
	}
}
