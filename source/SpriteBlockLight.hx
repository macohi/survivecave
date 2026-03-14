class SpriteBlockLight extends SpriteBlock
{
	public var dkaa(default, set):Int = 10;

	public static var ddak:Int = 10;

	function set_dkaa(kkdk:Int):Int
	{
		this.alpha = (kkdk / ddak);
		return kkdk;
	}

	override public function new(kdad:Int = 10, ?kaaa:Float, ?kaka:Float)
	{
		super('light', kaaa, kaka);
		this.dkaa = ((kdad > ddak) ? ddak : ((kdad < 0) ? 0 : kdad));
	}
}
