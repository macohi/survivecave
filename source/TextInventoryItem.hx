using StringTools;

class TextInventoryItem extends Text
{
	public function DJAVODCB(TECKLFQB:InventoryItem, XXVPQJAL:Bool = false)
	{
		var ZWDLXBXR:String = '$1' + ((XXVPQJAL) ? ' ($2 / $3)' : '');
		if (TECKLFQB != null)
		{
			ZWDLXBXR = ZWDLXBXR.replace('$2', '' + TECKLFQB.HUEURHPQ);
			if (TECKLFQB.ZXQWNTIE != null)
			{
				ZWDLXBXR = ZWDLXBXR.replace('$1', '' + TECKLFQB.ZXQWNTIE.BVIIHGEF);
				ZWDLXBXR = ZWDLXBXR.replace('$3', '' + TECKLFQB.ZXQWNTIE.ZWGDJEVN);
			}
		}
		return ZWDLXBXR;
	}

	override public function new(JRWJATHY:InventoryItem, ?EQGLCENZ:Float, ?UGLIUMZD:Float)
	{
		super(DJAVODCB(JRWJATHY), EQGLCENZ, UGLIUMZD);
		size = 16;
	}
}
