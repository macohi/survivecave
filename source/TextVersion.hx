import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?HRBZCVHS:Float, ?KJVFPNJZ:Float)
	{
		super('Survivecave Indev ${Application.current.meta.get('version')}', HRBZCVHS, KJVFPNJZ);
	}
}
