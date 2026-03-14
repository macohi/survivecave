import flixel.FlxG;

class StateGameplay extends State
{
	override public function new(gsn:Int = -1)
	{
		super();

		Global.LAST_GAMEPLAY_STATE = gsn;
	}

	public var layer_ui:Null<Int> = 1000;

	override public function create()
	{
		super.create();

		addToLayer(new TextWatermark(), layer_ui);
	}
}
