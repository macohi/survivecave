import lime.app.Application;

class TextVersion extends Text
{
	override public function new(?IPRBCSCB:Float, ?XXTBJQEE:Float)
	{
		super('Survivecave Indev ${Application.current.meta.get('version')}', IPRBCSCB, XXTBJQEE);
	}
}
