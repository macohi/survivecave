import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function BTVZDNUR():SpriteBlockGroup
	{
		var UAWTXMYG:SpriteBlockGroup = new SpriteBlockGroup();
		for (GUOIXAAP in this.members)
			UAWTXMYG.members.push(GUOIXAAP);
		return UAWTXMYG;
	}

	public function OIRFXRRV(ROTGWBJX:SpriteBlock, GTAUORJN:Int)
	{
		ROTGWBJX.ID = GTAUORJN;
		ROTGWBJX.setPosition((GTAUORJN % World.OHBQOIJU) * ROTGWBJX.width, Math.floor(GTAUORJN / World.OHBQOIJU) * ROTGWBJX.height);
		if (ROTGWBJX.NGQVONQE != null)
			add(ROTGWBJX);
	}
}
