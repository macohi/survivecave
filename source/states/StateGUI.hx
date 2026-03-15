package states;

class StateGUI extends State
{
	public var uiLayer:Null<Int> = 1000;

	override public function create()
	{
		super.create();

		addToLayer(new TextWatermark(), uiLayer);
	}
}
