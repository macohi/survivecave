import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function EURYNUTR():SpriteBlockGroup
	{
		var BGVCWESB:SpriteBlockGroup = new SpriteBlockGroup();
		for (EEQNUIGP in this.members)
			BGVCWESB.members.push(EEQNUIGP);
		return BGVCWESB;
	}

	public function DDAWCSHK(JZMCGNSO:SpriteBlock, ZFNYKMMO:Int)
	{
		JZMCGNSO.ID = ZFNYKMMO;
		JZMCGNSO.setPosition((ZFNYKMMO % World.WSNKGMOC) * JZMCGNSO.width, Math.floor(ZFNYKMMO / World.WSNKGMOC) * JZMCGNSO.height);
		if (JZMCGNSO.EDAKXEND != null)
			add(JZMCGNSO);
	}
}
