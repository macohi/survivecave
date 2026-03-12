import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var layers:Array<FlxTypedContainer<FlxBasic>> = [];

	public function addToLayer(basic:FlxBasic, layer:Int)
	{
		if (basic == null)
		{
			trace('Adding null FlxBasic object unsupported.');
			return;
		}

		if (layers == null)
		{
			trace('"layers" variable uninitalized or destroyed. Reinitalizing...');
			layers = [];
		}

		while (layers.length < layer)
		{
			final container = new FlxTypedContainer<FlxBasic>();
			container.ID = layers.length;

			layers.push(container);
			add(container);
		}

		layers[layer - 1].add(basic);
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
