import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function YGBBNRFU():SpriteBlockGroup
	{
		var MJFIZVJY:SpriteBlockGroup = new SpriteBlockGroup();
		for (LCAMFNDB in this.members)
			MJFIZVJY.members.push(LCAMFNDB);
		return MJFIZVJY;
	}

	public function XSNJGRXZ(JQAVUVJA:SpriteBlock, KTDBNRHU:Int)
	{
		JQAVUVJA.ID = KTDBNRHU;
		JQAVUVJA.setPosition((KTDBNRHU % World.ZSNJDPIO) * JQAVUVJA.width, Math.floor(KTDBNRHU / World.ZSNJDPIO) * JQAVUVJA.height);
		if (JQAVUVJA.RZGZEZLM != null)
			add(JQAVUVJA);
	}
}
