package states;

import flixel.FlxGame;
import flixel.system.debug.DebuggerUtil;
import flixel.system.debug.FlxDebugger;
import flixel.FlxG;
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

		switchToLayer(basic, layer);
	}

	public function switchToLayer(basic:FlxBasic, layer:Null<Int>)
	{
		if (basic == null)
		{
			trace('A non-null FlxBasic object required.');
			return;
		}

		if (layer == null)
		{
			trace('A proper layer required.');
			return;
		}

		if (layer > layers.length || layers[layer - 1] == null)
		{
			trace('Cannot switch to non-existant layer');
			return;
		}

		for (layer in layers)
		{
			if (layer.members.contains(basic))
				layer.remove(basic);
		}

		layers[layer - 1].add(basic);
	}

	public function switchState(state:State)
	{
		// TODO: add transition

		FlxG.debugger.visible = false;

		FlxG.switchState(() -> state);
	}
}
