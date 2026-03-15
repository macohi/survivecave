package objects.texts;

import flixel.math.FlxMath;
import flixel.FlxG;

class TextScore extends Text
{
	public var scoreText(get, never):String;

	function get_scoreText():String
	{
		try
		{
			return 'Score: ${FlxMath.roundDecimal(Global.SCORE?.value ?? 0, 2)}';
		}
		catch (e)
		{
			return this.text;
		}
	}

	override public function new(?x:Float, ?y:Float)
	{
		super(scoreText, x, y, 16);
		alignment = CENTER;
		fieldWidth = FlxG.width;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		this.text = scoreText;
		this.y = FlxG.height - this.height * 1.25;
	}
}
