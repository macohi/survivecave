package states;

class StateGUI extends State
{
	public var layer_ui:Null<Int> = 1000;

	override public function create()
	{
		super.create();

		addToLayer(new TextWatermark(), layer_ui);
	}
}
