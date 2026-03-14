import openfl.display.FPS;
import lime.app.Application;

class TextWatermark extends Text
{
	public var watermarkText(get, never):String;

	function get_watermarkText():String
	{
		var wt = '${Application.current.meta.get('version')}';

		wt += ' (fps: ${Main.FPS.currentFPS})';

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
