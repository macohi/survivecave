import flixel.FlxBasic;
import flixel.group.FlxContainer.FlxTypedContainer;
import flixel.FlxState;

class State extends FlxState
{
	public var layers:Array<FlxTypedContainer<FlxBasic>> = [];

	var lastUsedLayer:Null<Int> = null;

	public function addToLayer(basic:FlxBasic, ?layer:Null<Int>)
	{
		if (basic == null)
		{
			trace('Adding null FlxBasic object unsupported.');
			return;
		}

		if (layer == null)
		{
			if (lastUsedLayer == null)
			{
				lastUsedLayer = 0;
			}

			layer = lastUsedLayer + 1;
		}
		else
		{
			lastUsedLayer = layer;
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
}
