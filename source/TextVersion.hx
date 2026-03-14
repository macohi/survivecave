import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?adak:Float, ?ekek:Float)
	{
		super('Survivecave Indev ${Application.current.meta.get('version')}', adak, ekek);
	}
}
