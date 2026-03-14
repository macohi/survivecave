import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?VESYCBOI:Float, ?SWDHFMPT:Float)
	{
		super('Survivecave Indev ${Application.current.meta.get('version')}', VESYCBOI, SWDHFMPT);
	}
}
