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
	
	override function add(basic:FlxBasic):FlxBasic {

		if (Type.getClassName(Type.getClass(this)) != 'State')
			trace('Recommended to use "addToLayer"');

		return super.add(basic);
	}
}
