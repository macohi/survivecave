import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?IWQPOGGL:Float, ?QBDBWWMH:Float)
	{
		super('Survivecave Indev ${Application.current.meta.get('version')}', IWQPOGGL, QBDBWWMH);
	}
}
