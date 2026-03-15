package objects.texts;

import flixel.math.FlxMath;
import flixel.FlxG;
import lime.app.Application;

class TextWatermark extends Text
{
	public var watermarkText(get, never):String;

	function get_watermarkText():String
	{
		var wt = 'V${Application.current.meta.get('version')}';

		var appends:String = '';

		@:privateAccess
		{
			final stats = FlxG.debugger.windows.debugger.stats;
			
			final fpsGraph = stats.fpsGraph;
			final memoryGraph = stats.memoryGraph;

			appends += 'fps: ${fpsGraph.curLabel.text.substr(0, fpsGraph.curLabel.text.length - 4)}, ';
			appends += 'memory: ${memoryGraph.curLabel.text} / ${memoryGraph.maxLabel.text}, ';
		}

		if (appends != '')
			wt += ' (${appends.substr(0, appends.length - 2)})';

		return wt;
	}

	override public function new(?x:Float, ?y:Float)
	{
		super(watermarkText, x, y);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		this.text = watermarkText;
	}
}
