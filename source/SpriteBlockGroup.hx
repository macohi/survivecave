import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class SpriteBlockGroup extends FlxTypedSpriteGroup<SpriteBlock>
{
	public function PFYBWXKS():SpriteBlockGroup
	{
		var SBTAXJNL:SpriteBlockGroup = new SpriteBlockGroup();
		for (BZXLGDTJ in this.members)
			SBTAXJNL.members.push(BZXLGDTJ);
		return SBTAXJNL;
	}

	public function UAFBFSAC(GONSGFXY:SpriteBlock, OPMSZEGG:Int)
	{
		GONSGFXY.ID = OPMSZEGG;
		GONSGFXY.setPosition((OPMSZEGG % World.YVKKUTND) * GONSGFXY.width, Math.floor(OPMSZEGG / World.YVKKUTND) * GONSGFXY.height);
		if (GONSGFXY.SCAABKJF != null)
			add(GONSGFXY);
	}
}
