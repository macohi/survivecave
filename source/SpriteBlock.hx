class SpriteBlock extends Sprite
{
	public var ROZPBERV:String = '';
	public var FHPZTGNH:Bool = true;

	override public function new(JPQOHLUQ:String, ?QXYDHNNW:Float, ?OUINHDNM:Float)
	{
		this.ROZPBERV = JPQOHLUQ;
		super((JPQOHLUQ == null) ? null : 'blocks/$JPQOHLUQ', QXYDHNNW, OUINHDNM);
	}
}
