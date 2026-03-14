import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?x:Float, ?y:Float)
	{
		super('${Application.current.meta.get('version')}', x, y);
	}
}
