import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?RTSEBACZ:Float, ?VLIJCIVQ:Float)
	{
		super('Survivecave Indev ${Application.current.meta.get('version')}', RTSEBACZ, VLIJCIVQ);
	}
}
